# **Block Collision Simulation for Approximating \(\pi\)**  

This project simulates elastic collisions between two blocks and a wall to approximate the value of \(\pi\). The method is based on a fascinating connection between collision mechanics and the digits of \(\pi\). The simulation is automated using Lua, with a visualization of the collisions included for added insight.

---

## **Introduction**  
In this simulation, two blocks with masses in a specific ratio (e.g., \(1:100\)) collide elastically with each other and with a wall. By counting the total number of collisions, we can approximate \(\pi\) with remarkable accuracy. This method demonstrates a surprising link between the principles of physics and pure mathematics.

---

## **Scientific Explanation**  

### **The Physics**  
1. **Elastic Collisions:**  
   - Elastic collisions conserve both momentum and kinetic energy.  
   - For two blocks of masses \(m_1\) and \(m_2\), their velocities change after each collision according to these conservation laws.  

2. **System Setup:**  
   - Block 1 (mass \(m_1 = 1\)) starts stationary near a wall.  
   - Block 2 (mass \(m_2\)) moves towards Block 1 with an initial velocity.  
   - \(m_2\) is much larger than \(m_1\), with a mass ratio of \(10^n:1\) (e.g., \(100:1\) for \(n=2\)).  

3. **Collisions:**  
   - When Block 2 collides with Block 1, both blocks exchange momentum.  
   - Block 1 collides with the wall and rebounds.  
   - This process repeats until Block 2 moves away from Block 1 without further interaction.  

### **Connection to \(\pi\):**  
The total number of collisions equals the first \(n+1\) digits of \(\pi\), where \(n\) is the power of 10 in the mass ratio. For example:
   - Mass ratio \(1:100\) (\(10^2:1\)) results in \(31\) collisions (approximating \(\pi \approx 3.14\)).  
   - Mass ratio \(1:10,000\) (\(10^4:1\)) gives \(314\) collisions (\(\pi \approx 3.141\)).  

This surprising connection arises because the collision dynamics mimic a mathematical problem involving the quarter-circle’s geometry.

---

## **Features of the Project**  
- **Physics Simulation:** Implements conservation of momentum and energy for elastic collisions.  
- **Visualization:** Animates the movement and collisions of the blocks.  
- **Automation:** Counts and displays the number of collisions to approximate \(\pi\).  

---

4. **Visualization:**  
   Watch the animated collisions and the real-time collision count.

---

## **Visualization**  
The animation shows two blocks colliding and the total collision count updating in real-time. The visualization highlights how the system behaves as the blocks interact.

---

## **Contributions**  
Feel free to fork the project, improve the visualization, or add support for higher mass ratios!

---

## **Acknowledgments**  
This project is inspired by a classic physics problem showcasing the unexpected relationship between physics and the digits of \(\pi\).

---

If you’d like to tweak this further or add sections (e.g., results or further reading), let me know!
