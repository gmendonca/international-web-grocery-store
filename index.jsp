<!doctype html>

<html>
  <head>
    <title>
      Main Page
    </title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
  </head>
  <body>

    <header>
      <div id="header-menu-items">
        <form action="index.jsp">
            <button type="submit" class="menu-item">
              Home
            </button>
        </form>
        <form action="country.jsp">
            <button type="submit" name="title" value="Brazil" class="menu-item">
              Brazil
            </button>
            <button type="submit" name="title" value="China" class="menu-item">
              China
            </button>
            <button type="submit" name="title" value="India" class="menu-item">
              India
            </button>
        </form>
        <form action="#">
            <button type="submit" class="menu-item">
              About us
            </button>
        </form>
        <form action="#">
            <button type="submit" class="menu-item">
              Contact us
            </button>
        </form>
      </div>
    </header>

    <section>
      <div class="logo">
        <h1><a href="#">Foodie360</a></h1>
        <h2>Find Your Food Everywhere!</h2>
        <p>International food market from everywhere, here at the United States of America.</p>
        <hr>
      </div>
    </section>

    <section>
      <div class="container row">
        <form action="country.jsp">
        <div class="column">
          <button type="submit" name="title" value="Brazil"><img src="img/Brazil.png" alt="Brazil" height="160" width="160"></button>
          <h2>Brazil</h2>
        </div>
        <div class="column">
          <button type="submit" name="title" value="China"><img src="img/China.png" alt="China" height="160" width="160"></button>
          <h2>China</h2>
        </div>
        <div class="column">
          <button type="submit" name="title" value="India"><img src="img/India.png" alt="India" height="160" width="160"></button>
          <h2>India</h2>
        </form>
        </div>
    </section>

    <footer>
    </footer>
  </body>
</html>
