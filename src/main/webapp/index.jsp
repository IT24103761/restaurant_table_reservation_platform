<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Amali Restaurant - Table Reservation</title>
    <link rel="stylesheet" href="src/Home/Css/Style.css">
    <link rel="stylesheet" href="src/Home/Css/Style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        #showcase

    </style>
</head>
<body>
<header>
    <div class="container">
        <div id="branding">
            <h1><span class="highlight">Amali</span> Restaurant</h1>
        </div>
        <nav>
            <ul>
                <li class="current"><a href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="src/Home/Page/about.jsp"><i class="fas fa-info-circle"></i> About</a></li>
                <li><a href="src/Home/Page/reservation.jsp"><i class="fas fa-calendar-alt"></i> Reservations</a></li>
                <li><a href="contact.jsp"><i class="fas fa-envelope"></i> Contact</a></li>
            </ul>
        </nav>
    </div>
</header>

<section id="showcase">
    <div class="container">
        <h1>Fine Dining Experience</h1>
        <p>Book your table at Amali Restaurant for an unforgettable culinary journey</p>
        <a href="src/Home/Page/reservation.jsp" class="btn-primary">Reserve Now <i class="fas fa-arrow-right"></i></a>
    </div>
</section>

<section id="reservation-box">
    <div class="container">
        <h2>Make a Reservation</h2>
        <form action="src/Home/Page/reservation.jsp" method="post">
            <div class="form-group">
                <label for="date"><i class="far fa-calendar-alt"></i> Date:</label>
                <input type="date" id="date" name="date" required>
            </div>
            <div class="form-group">
                <label for="time"><i class="far fa-clock"></i> Time:</label>
                <input type="time" id="time" name="time" required>
            </div>
            <div class="form-group">
                <label for="guests"><i class="fas fa-user-friends"></i> Number of Guests:</label>
                <select id="guests" name="guests" required>
                    <option value="1">1 Person</option>
                    <option value="2">2 People</option>
                    <option value="3">3 People</option>
                    <option value="4">4 People</option>
                    <option value="5">5 People</option>
                    <option value="6">6 People</option>
                    <option value="7">7 People</option>
                    <option value="8">8 People</option>
                    <option value="9">9+ People</option>
                </select>
            </div>
            <button type="submit" class="button">
                <i class="fas fa-search"></i> Check Availability
            </button>
        </form>
    </div>
</section>

<section id="features">
    <div class="container">
        <h2 class="section-title">Why Choose Amali</h2>
        <div class="features-grid">
            <div class="feature-box">
                <img src="https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Fine Dining">
                <h3>Fine Dining</h3>
                <p>Experience our exquisite menu crafted by award-winning chefs using locally-sourced ingredients.</p>
            </div>
            <div class="feature-box">
                <img src="https://images.unsplash.com/photo-1551218808-94e220e084d2?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Wine Selection">
                <h3>Premium Wine Selection</h3>
                <p>Pair your meal with our carefully curated wine collection featuring over 200 international varieties.</p>
            </div>
            <div class="feature-box">
                <img src="https://images.unsplash.com/photo-1549488344-1f9b8d2bd1f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Ambiance">
                <h3>Elegant Ambiance</h3>
                <p>Enjoy our sophisticated and comfortable dining environment with live music on weekends.</p>
            </div>
        </div>
    </div>
</section>

<section id="testimonials">
    <div class="container">
        <h2 class="section-title">What Our Guests Say</h2>
        <div class="testimonial">
            <img src="https://randomuser.me/api/portraits/women/43.jpg" alt="Customer">
            <blockquote>
                "The best dining experience I've had this year! The service was impeccable and the food was extraordinary."
                <cite>- Sarah Johnson</cite>
            </blockquote>
        </div>
    </div>
</section>

<footer>
    <div class="container">
        <div class="footer-grid">
            <div class="footer-col">
                <h1>Amali Restaurant</h1>
                <p>123 Gourmet Avenue<br>Foodie City, FC 12345<br>Phone: (123) 456-7890</p>
            </div>
            <div class="footer-col">
                <h3>Hours</h3>
                <p>Monday - Thursday: 5PM - 10PM<br>
                    Friday - Saturday: 5PM - 11PM<br>
                    Sunday: 5PM - 9PM</p>
            </div>
            <div class="footer-col">
                <h3>Follow Us</h3>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                </div>
            </div>
        </div>
        <div class="copyright">
            <p>Amali Restaurant &copy; 2023 | <a href="src/Home/Js/script.js">Privacy Policy</a> | <a href="terms.jsp">Terms of Service</a></p>
        </div>
    </div>
</footer>
</body>
</html>