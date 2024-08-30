import streamlit as st
import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression

st.sidebar.image(r'logo\linear_reg.png')
# Set up the sidebar for user input
st.sidebar.title("Linear Regression Visualization Parameters")

# Dropdown for selecting the plot
plot_type = st.sidebar.selectbox(
    "Select the plot type",
    ("", "Straight Line", "Circle", "Parabola", "Spiral"),
)

st.image(r'logo\innomatics-footer-logo.webp')
if plot_type == "":
    st.write('''This project is an interactive data visualization tool built using Streamlit, allowing users to explore various 
             mathematical plots such as Linear Regression, Circle, Parabola, Spiral, and Scatter Plot with Linear Regression. 
             Users can dynamically select the type of plot they want to visualize from a dropdown menu and adjust specific parameters 
             for each plot through sliders in the sidebar. This enables users to see how different parameters affect the visual 
             representation of the mathematical functions in real-time. The project is ideal for educational purposes, providing an 
             intuitive way to understand the behavior of different mathematical models and their graphical representations.''')
else:
    # Common Parameters for Data Points and Noise
    points = st.sidebar.slider("Number of Data Points", 50, 1000, 100, key="common_points")
    noise = st.sidebar.slider("Noise Level", 0.0, 2.0, 0.5, key="common_noise")

    
    # Create the plot based on the selection
    fig, ax = plt.subplots()
    
    # Parameters for Straight Line
    if plot_type == "Straight Line":
        lr_intercept = st.sidebar.slider("Intercept", -10.0, 10.0, 2.0, key="lr_intercept")
        lr_slope = st.sidebar.slider("Slope", -5.0, 5.0, 0.5, key="lr_slope")
        x_lr = np.linspace(-10, 10, points)
        y_lr = lr_slope * x_lr + lr_intercept + noise * np.random.randn(points)
        
        # Perform Linear Regression
        model = LinearRegression()
        model.fit(x_lr.reshape(-1, 1), y_lr)
        y_pred = model.predict(x_lr.reshape(-1, 1))
        
        # Plotting
        ax.scatter(x_lr, y_lr, color='blue', label='Actual Data Points')
        ax.plot(x_lr, y_pred, color='red', label=f'Predicted Line (y = {model.coef_[0]:.2f}x + {model.intercept_:.2f})')
        ax.set_title("Linear Regression - Straight Line")
        ax.legend()
        ax.grid(True)
        st.write('''
                 Visualizes a linear relationship between two variables. 
                 Users can adjust the slope and intercept to see how changes
                 affect the line of best fit. This plot demonstrates the concept of linear regression.
                 ''')
    
    # Parameters for Circle
    elif plot_type == "Circle":
        circle_radius = st.sidebar.slider("Radius", 0.1, 10.0, 5.0, key="circle_radius")
        theta = np.linspace(0, 2 * np.pi, points)
        x_circle = circle_radius * np.cos(theta) + noise * np.random.randn(points)
        y_circle = circle_radius * np.sin(theta) + noise * np.random.randn(points)
        
        # Perform Linear Regression
        model_x = LinearRegression()
        model_y = LinearRegression()
        model_x.fit(theta.reshape(-1, 1), x_circle)
        model_y.fit(theta.reshape(-1, 1), y_circle)
        x_pred = model_x.predict(theta.reshape(-1, 1))
        y_pred = model_y.predict(theta.reshape(-1, 1))
        
        # Plotting
        ax.scatter(x_circle, y_circle, color='blue', label='Actual Data Points')
        ax.plot(x_pred, y_pred, color='red', label='Predicted Circle')
        ax.set_title("Circle")
        ax.axis('equal')
        ax.legend()
        ax.grid(True)
        st.write('''
                 Displays data points arranged in a circular pattern. 
                 Users can adjust the radius to change the size of the circle. 
                 This plot fits a circular model to the data, 
                 showing how well the model matches the actual data.
                 ''')

    # Parameters for Parabola
    elif plot_type == "Parabola":
        parabola_a = st.sidebar.slider("Coefficient a", -5.0, 5.0, 1.0, key="parabola_a")
        parabola_b = st.sidebar.slider("Coefficient b", -5.0, 5.0, 0.0, key="parabola_b")
        parabola_c = st.sidebar.slider("Coefficient c", -10.0, 10.0, 0.0, key="parabola_c")
        x_parabola = np.linspace(-10, 10, points)
        y_parabola = parabola_a * x_parabola**2 + parabola_b * x_parabola + parabola_c + noise * np.random.randn(points)
        
        # Perform Polynomial Regression (2nd degree for parabolas)
        poly_features = np.vstack([x_parabola**2, x_parabola, np.ones(points)]).T
        model = LinearRegression()
        model.fit(poly_features, y_parabola)
        y_pred = model.predict(poly_features)
        
        # Plotting
        ax.scatter(x_parabola, y_parabola, color='blue', label='Actual Data Points')
        ax.plot(x_parabola, y_pred, color='red', label=f'Predicted Parabola (y = {parabola_a}x^2 + {parabola_b}x + {parabola_c})')
        ax.set_title("Parabola")
        ax.legend()
        ax.grid(True)
        st.write('''
         Shows data points that form a parabolic shape. 
         Users can modify the coefficients of the quadratic function to see how the parabola changes. 
         This plot fits a polynomial regression to the data to illustrate the parabolic relationship.
         ''')

    # Parameters for Spiral
    elif plot_type == "Spiral":
        spiral_turns = st.sidebar.slider("Number of Turns", 1, 20, 5, key="spiral_turns")
        theta_spiral = np.linspace(0, spiral_turns * 2 * np.pi, points)
        r_spiral = theta_spiral
        x_spiral = r_spiral * np.cos(theta_spiral) + noise * np.random.randn(points)
        y_spiral = r_spiral * np.sin(theta_spiral) + noise * np.random.randn(points)
        
        # Perform Polynomial Regression for spiral (Complex pattern)
        model_x = LinearRegression()
        model_y = LinearRegression()
        model_x.fit(theta_spiral.reshape(-1, 1), x_spiral)
        model_y.fit(theta_spiral.reshape(-1, 1), y_spiral)
        x_pred = model_x.predict(theta_spiral.reshape(-1, 1))
        y_pred = model_y.predict(theta_spiral.reshape(-1, 1))
        
        # Plotting
        ax.scatter(x_spiral, y_spiral, color='blue', label='Actual Data Points')
        ax.plot(x_pred, y_pred, color='red', label='Predicted Spiral')
        ax.set_title("Spiral")
        ax.legend()
        ax.grid(True)
        
        st.markdown('''
         <p style="color: #2E581E; font-size: 24px;">
         Visualizes data points arranged in a spiral pattern. 
         Users can adjust the number of turns to modify the spiral's appearance. 
         This plot fits a polynomial regression to approximate the spiral shape, 
         demonstrating a more complex relationship.
         </p>
         ''', unsafe_allow_html=True)

    
   
    
    # Display the plot
    st.pyplot(fig)
