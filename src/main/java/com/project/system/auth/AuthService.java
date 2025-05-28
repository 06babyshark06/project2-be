package com.project.system.auth;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AuthService {
    private final RestTemplate restTemplate = new RestTemplate();

    @Value("${keycloak.server-url}")
    private String keycloakUrl;

    @Value("${keycloak.realm}")
    private String realm;

    @Value("${keycloak.client-id}")
    private String clientId;

    @Value("${keycloak.client-secret}")
    private String clientSecret;

    public LoginResponse login(LoginRequest request) {
        String url = keycloakUrl + "/realms/" + realm + "/protocol/openid-connect/token";

        MultiValueMap<String, String> form = new LinkedMultiValueMap<>();
        form.add("grant_type", "password");
        form.add("client_id", clientId);
        form.add("client_secret", clientSecret);
        form.add("username", request.username());
        form.add("password", request.password());

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        HttpEntity<?> entity = new HttpEntity<>(form, headers);
        ResponseEntity<Map> response = restTemplate.postForEntity(url, entity, Map.class);

        Map body = response.getBody();
        return new LoginResponse(
                (String) body.get("access_token"),
                (String) body.get("refresh_token"),
                ((Number) body.get("expires_in")).longValue()
        );
    }

    public void register(RegisterRequest request) {
        // Step 1: get admin token
        String tokenUrl = keycloakUrl + "/realms/master/protocol/openid-connect/token";

        MultiValueMap<String, String> form = new LinkedMultiValueMap<>();
        form.add("grant_type", "password");
        form.add("client_id", "admin-cli");
        form.add("username", "admin");
        form.add("password", "1");

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        ResponseEntity<Map> tokenResp = restTemplate.postForEntity(tokenUrl, new HttpEntity<>(form, headers), Map.class);

        String token = (String) tokenResp.getBody().get("access_token");

        // Step 2: create user
        String createUrl = keycloakUrl + "/admin/realms/" + realm + "/users";

        headers = new HttpHeaders();
        headers.setBearerAuth(token);
        headers.setContentType(MediaType.APPLICATION_JSON);

        // Step 2.1: Build custom attributes
        Map<String, List<String>> attributes = new HashMap<>();
        attributes.put("fullName", List.of(request.fullName()));
        attributes.put("phoneNumber", List.of(request.phoneNumber()));
        attributes.put("identityCard", List.of(request.identityCard()));

        // Step 2.2: Build user payload
        Map<String, Object> payload = new HashMap<>();
        payload.put("username", request.username());
        payload.put("email", request.email());
        payload.put("enabled", true);
        payload.put("attributes", attributes);
        payload.put("credentials", List.of(Map.of(
                "type", "password",
                "value", request.password(),
                "temporary", false
        )));


        HttpEntity<?> userEntity = new HttpEntity<>(payload, headers);
        restTemplate.postForEntity(createUrl, userEntity, String.class);
    }
}
