package com.project.system.filter;

import com.project.system.user.UserService;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class UserSyncFilter extends OncePerRequestFilter {
    private final UserService service;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() instanceof Jwt jwt) {
            String username = jwt.getClaimAsString("preferred_username");
            String email = jwt.getClaimAsString("email");
            String sub = jwt.getClaimAsString("sub");
            String phoneNumber= jwt.getClaimAsString("phoneNumber");
            String identityCard= jwt.getClaimAsString("identityCard");
            String fullName = jwt.getClaimAsString("fullName");
            Set<String> roles = Optional.ofNullable(jwt.getClaim("realm_access"))
                    .filter(Map.class::isInstance)
                    .map(Map.class::cast)
                    .map(realm -> (List<?>) realm.get("roles"))
                    .map(list -> list.stream()
                            .map(Object::toString)
                            .collect(Collectors.toSet()))
                    .orElse(Collections.emptySet());

            if (username != null && email != null) {
                service.syncUser(username, email, sub, phoneNumber, identityCard, fullName, roles);
            }
        }

        filterChain.doFilter(request, response);
    }
}
