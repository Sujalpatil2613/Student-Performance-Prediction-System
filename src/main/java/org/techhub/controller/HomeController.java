package org.techhub.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.techhub.model.User;
import org.techhub.services.UserService;

@Controller
public class HomeController {

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String home() {
        return "Home";
    }

    @GetMapping("/AdminLogin")
    public String loginPage() {
        return "AdminLogin";
    }

    @GetMapping("/admin/dashboard")
    public String adminDashboard() {
        return "AdminDashboard";
    }

    @GetMapping("/admin/addUser")
    public String showAddUserPage(Model model) {
        model.addAttribute("user", new User());
        return "AddUser";
    }

    @PostMapping("/admin/addUser")
    public String addUser(@ModelAttribute("user") User user, Model model) {
        boolean added = userService.addUser(user);
        if (added) {
            model.addAttribute("success", "User added successfully!");
        } else {
            model.addAttribute("error", "Email already exists!");
        }
        return "AddUser";
    }

    @GetMapping("/admin/viewUsers/{role}")
    public String viewUsers(@PathVariable("role") String role, Model model) {
        model.addAttribute("user", userService.getUsersByRole(role.toUpperCase()));
        model.addAttribute("role", role.toUpperCase());
        return "ViewUser";
    }

    @PostMapping("/admin/updateUser")
    public String updateUser(@ModelAttribute User user) {
        userService.updateUser(user);
        return "redirect:/admin/viewUsers/" + user.getRole();
    }

    @GetMapping("/admin/deleteUser/{id}")
    public String deleteUser(@PathVariable int id, @RequestParam String role) {
        userService.deleteUser(id);
        return "redirect:/admin/viewUsers/" + role;
    }

    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    @PostMapping("/doLogin")
    public String doLogin(@RequestParam String email,
                         @RequestParam String password,
                         @RequestParam String role,
                         Model model,
                         HttpSession session) {

        User user = userService.login(email, password, role);

        if (user != null) {

            // 🔍 DEBUG
            System.out.println("USER OBJECT = " + user);
            System.out.println("USER NAME = " + user.getName());
            System.out.println("USER EMAIL = " + user.getEmail());

            // ✅ SESSION SET
            session.setAttribute("user", user);

            // 🔥 FIX: NULL SAFE NAME
            String studentName;

            if (user.getName() != null && !user.getName().trim().isEmpty()) {
                studentName = user.getName().trim().toLowerCase();
            } else {
                // fallback → email prefix
                studentName = user.getEmail().split("@")[0].toLowerCase();
            }

            session.setAttribute("studentName", studentName);

            // 🔍 DEBUG
            System.out.println("SESSION studentName = " + studentName);

            // 🔀 REDIRECT
            if (role.equalsIgnoreCase("TEACHER")) {
                return "redirect:/teacher/dashboard";
            } else if (role.equalsIgnoreCase("STUDENT")) {
                return "redirect:/student/dashboard";
            }

        } else {
            model.addAttribute("error", "Invalid Email or Password");
            return "login";
        }

        return "login";
    }
   
}