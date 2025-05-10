<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Amali Restaurant - Table Reservation</title>
    <link rel="stylesheet" href="src/Home/Css/Style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        #showcase {
            /* Add your showcase styles here */
        }
        .login-btn {
            background-color: #4CAF50;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-left: auto; /* This will push it to the right */
        }
        .login-btn:hover {
            background-color: #45a049;
        }
        .user-profile {
            display: flex;
            align-items: center;
            margin-left: auto; /* This will push it to the right */
        }
        .user-profile img {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            margin-right: 8px;
        }
        .dropdown {
            position: relative;
            display: inline-block;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }
        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }
        .dropdown-content a:hover {
            background-color: #f1f1f1;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
        header .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        nav ul {
            display: flex;
            align-items: center;
        }
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
                <% if (session.getAttribute("username") == null) { %>
                <li><a href="login.jsp" class="login-btn"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                <% } else { %>
                <li class="dropdown">
                    <div class="user-profile">
                        <img src="src/Home/img/user-icon.png" alt="User">
                        <span><%= session.getAttribute("username") %></span>
                    </div>
                    <div class="dropdown-content">
                        <a href="profile.jsp"><i class="fas fa-user"></i> My Profile</a>
                        <a href="myreservations.jsp"><i class="fas fa-calendar-check"></i> My Reservations</a>
                        <a href="login.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    </div>
                </li>
                <% } %>
            </ul>
        </nav>
    </div>
</header>

<!-- Rest of your existing content remains the same -->

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
            <img src="src/Home/img/viraj.jpg" alt="Customer">
            <blockquote>
                "The best dining experience I've had this year! The service was impeccable and the food was extraordinary."
                <cite>- sanjeewa</cite>
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
    </div>
</footer>
</body>
</html>