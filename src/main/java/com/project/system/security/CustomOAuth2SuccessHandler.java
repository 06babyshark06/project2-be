package com.project.system.security;

import com.project.system.user.User;
import com.project.system.user.UserRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Component
@RequiredArgsConstructor
public class CustomOAuth2SuccessHandler implements AuthenticationSuccessHandler {
    private final UserRepository userRepository;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        OAuth2AuthenticationToken token = (OAuth2AuthenticationToken) authentication;
        OAuth2User user = token.getPrincipal();

        String sub = user.getAttribute("sub");
        String email = user.getAttribute("email");
        String username = user.getAttribute("preferred_username");
        String phoneNumber=user.getAttribute("phoneNumber");
        String identityCard=user.getAttribute("identityCard");
        String fullName =user.getAttribute("fullName");
        List<String> roles = (List<String>) ((Map<String, Object>) user.getAttribute("realm_access")).get("roles");
        Set<String> rolesSet = new HashSet<>(roles);

        User findedUser=userRepository.findByKeycloakId(sub).orElseGet(() -> userRepository.save(User.builder().name(fullName).keycloakId(sub).identityCard(identityCard).email(email).username(username).phoneNumber(phoneNumber).build()));
        findedUser.setRoles(rolesSet);
        userRepository.save(findedUser);
        response.sendRedirect("/");
    }
}
