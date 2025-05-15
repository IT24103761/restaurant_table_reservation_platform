<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Menu - Amali Restaurant</title>
  <link rel="stylesheet" href="src/Home/Css/menu.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    /* Navbar styles to match index.jsp */
    header {
      background: #333;
      color: white;
      padding: 1rem 0;
    }
    .container {
      width: 80%;
      margin: 0 auto;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    #branding h1 {
      margin: 0;
    }
    .highlight {
      color: #4CAF50;
    }
    nav ul {
      display: flex;
      list-style: none;
      margin: 0;
      padding: 0;
    }
    nav li {
      margin-left: 2rem;
    }
    nav a {
      color: white;
      text-decoration: none;
    }
    .current a {
      color: #4CAF50;
      font-weight: bold;
    }
    .login-btn {
      background: #4CAF50;
      padding: 0.5rem 1rem;
      border-radius: 4px;
    }
  </style>
</head>
<body>
<!-- Navigation Bar -->
<header>
  <div class="container">
    <div id="branding">
      <h1><span class="highlight">Amali</span> Restaurant</h1>
    </div>
    <nav>
      <ul>
        <li><a href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
        <li><a href="src/Home/Page/about.jsp"><i class="fas fa-info-circle"></i> About</a></li>
        <li class="current"><a href="menu.jsp"><i class="fas fa-utensils"></i> Menu</a></li>
        <li><a href="src/Home/Page/reservation.jsp"><i class="fas fa-calendar-alt"></i> Reservations</a></li>
        <li><a href="contact.jsp"><i class="fas fa-envelope"></i> Contact</a></li>
        <% if (session.getAttribute("username") == null) { %>
        <li><a href="login.jsp" class="login-btn"><i class="fas fa-sign-in-alt"></i> Login</a></li>
        <% } else { %>
        <li class="dropdown">
          <div class="user-profile">
            <img src="src/Home/img/user-icon.png" alt="User" width="30">
            <span><%= session.getAttribute("username") %></span>
          </div>
        </li>
        <% } %>
      </ul>
    </nav>
  </div>
</header>

<!-- Menu Content -->
<div class="menu-container">
  <h1>Our Delicious Menu</h1>

  <% if (request.getParameter("success") != null) { %>
  <div class="alert success">
    <i class="fas fa-check-circle"></i> Items added to your reservation!
    <a href="reservation.jsp">View Reservation</a>
  </div>
  <% } %>

  <!-- Rice Dishes -->
  <div class="menu-category">
    <h2><i class="fas fa-utensils"></i> Rice Dishes</h2>
    <div class="menu-items">

      <div class="menu-item">
        <div class="item-info">
          <h3>Chicken Fried Rice</h3>
          <p class="description">Fragrant basmati rice with chicken and vegetables</p>
          <p class="price">Rs. 1200.00</p>
        </div>
        <form action="add-to-order" method="post">
          <input type="hidden" name="itemId" value="R001">
          <button type="submit" class="add-btn">+ Add</button>
        </form>
      </div>

      <div class="menu-item">
        <div class="item-info">
          <h3>Vegetable Rice</h3>
          <p class="description">Seasonal vegetables with aromatic spices</p>
          <p class="price">Rs. 900.00</p>
        </div>
        <form action="add-to-order" method="post">
          <input type="hidden" name="itemId" value="R001">
          <button type="submit" class="add-btn">+ Add</button>
        </form>
      </div>

      <div class="menu-item">
        <div class="item-info">
          <h3>Egg Fried Rice</h3>
          <p class="description">Classic fried rice with scrambled eggs</p>
          <p class="price">Rs. 850.00</p>
        </div>
        <form action="add-to-order" method="post">
          <input type="hidden" name="itemId" value="R003">
          <button type="submit" class="add-btn">+ Add</button>
        </form>
      </div>
    </div>
  </div>

  <!-- Kottu Dishes -->
  <div class="menu-category">
    <h2><i class="fas fa-bread-slice"></i> Kottu</h2>
    <div class="menu-items">

      <div class="menu-item">
        <div class="item-info">
          <h3>Chicken Kottu</h3>
          <p class="description">Chopped roti with chicken and spices</p>
          <p class="price">Rs. 1100.00</p>
        </div>
        <form action="add-to-order" method="post">
          <input type="hidden" name="itemId" value="K001">
          <button type="submit" class="add-btn">+ Add</button>
        </form>
      </div>

      <div class="menu-item">
        <div class="item-info">
          <h3>Cheese Kottu</h3>
          <p class="description">Loaded with melted mozzarella cheese</p>
          <p class="price">Rs. 1300.00</p>
        </div>
        <form action="add-to-order" method="post">
          <input type="hidden" name="itemId" value="K002">
          <button type="submit" class="add-btn">+ Add</button>
        </form>
      </div>

      <div class="menu-item">
        <div class="item-info">
          <h3>Vegetable Kottu</h3>
          <p class="description">Fresh vegetables with chopped roti</p>
          <p class="price">Rs. 950.00</p>
        </div>
        <form action="add-to-order" method="post">
          <input type="hidden" name="itemId" value="K003">
          <button type="submit" class="add-btn">+ Add</button>
        </form>
      </div>
    </div>
  </div>

  <!-- Noodles -->
  <div class="menu-category">
    <h2><i class="fas fa-utensils"></i> Noodles</h2>
    <div class="menu-items">

      <div class="menu-item">
        <div class="item-info">
          <h3>Chicken Noodles</h3>
          <p class="description">Stir-fried noodles with chicken</p>
          <p class="price">Rs. 1000.00</p>
        </div>
        <form action="add-to-order" method="post">
          <input type="hidden" name="itemId" value="N001">
          <button type="submit" class="add-btn">+ Add</button>
        </form>
      </div>

      <div class="menu-item">
        <div class="item-info">
          <h3>Vegetable Noodles</h3>
          <p class="description">Mixed vegetables with noodles</p>
          <p class="price">Rs. 850.00</p>
        </div>
        <form action="add-to-order" method="post">
          <input type="hidden" name="itemId" value="N002">
          <button type="submit" class="add-btn">+ Add</button>
        </form>
      </div>
    </div>
  </div>

  <!-- Desserts -->
  <div class="menu-category">
    <h2><i class="fas fa-ice-cream"></i> Desserts</h2>
    <div class="menu-items">

      <div class="menu-item">
        <div class="item-info">
          <h3>Watalappan</h3>
          <p class="description">Traditional coconut custard pudding</p>
          <p class="price">Rs. 600.00</p>
        </div>
        <form action="add-to-order" method="post">
          <input type="hidden" name="itemId" value="D001">
          <button type="submit" class="add-btn">+ Add</button>
        </form>
      </div>

      <div class="menu-item">
        <div class="item-info">
          <h3>Chocolate Lava Cake</h3>
          <p class="description">Warm chocolate cake with molten center</p>
          <p class="price">Rs. 800.00</p>
        </div>
        <form action="add-to-order" method="post">
          <input type="hidden" name="itemId" value="D002">
          <button type="submit" class="add-btn">+ Add</button>
        </form>
      </div>

      <div class="menu-item">
        <div class="item-info">
          <h3>Ice Cream Sundae</h3>
          <p class="description">Vanilla ice cream with toppings</p>
          <p class="price">Rs. 700.00</p>
        </div>
        <form action="add-to-order" method="post">
          <input type="hidden" name="itemId" value="D003">
          <button type="submit" class="add-btn">+ Add</button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Footer -->
<footer>
  <div class="container">
    <p>Amali Restaurant &copy; 2023</p>
  </div>
</footer>
</body>
</html>