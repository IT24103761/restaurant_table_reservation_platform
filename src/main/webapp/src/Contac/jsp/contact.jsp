<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Contact Us - Gourmet Table</title>
  <link rel="stylesheet" href="../CSS/contact.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
<div class="contact-container">
  <h1>Contact</h1>

  <div class="contact-info">
    <div class="contact-item">
      <i class="fas fa-phone-alt icon"></i>
      <div class="contact-details">
        <h3>Phone Number</h3>
        <p>1-555-123-4567</p>
      </div>
    </div>

    <div class="contact-item">
      <i class="fas fa-envelope icon"></i>
      <div class="contact-details">
        <h3>Email</h3>
        <p>contact@gourmettable.com</p>
      </div>
    </div>

    <div class="contact-item">
      <i class="fas fa-map-marker-alt icon"></i>
      <div class="contact-details">
        <h3>Address</h3>
        <p>123 Main Street, Food City, FC 98765</p>
      </div>
    </div>

    <div class="contact-item">
      <i class="fas fa-clock icon"></i>
      <div class="contact-details">
        <h3>Opening Hours</h3>
        <p>Mon-Sun: 10:00 AM - 10:00 PM</p>
      </div>
    </div>
  </div>

  <div class="map-container" id="map"></div>
</div>

<script src="../JS/contact.js"></script>
<!-- Google Maps API - Replace with your API key -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap" async defer></script>
</body>
</html>