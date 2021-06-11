# All-Band-Adjustable-Dipole
### Motorized 10-80 Meter Adjustable Dipole 

A Self-Contained – Motorized Dipole Antenna System
Uses a Web-Based APP to set Element Lengths
Robust support for CAT and other Automation
Open Source – Using Open Source Tools

# Finished Product and APP!
- Antenna Winch on Tripod Mount.
  - Can Hang From a Rope or Use the Pole Mount Accesory.
- Node-Red Dashboard APP.  On Pixel 3 (Medium sized phone).

![All Band Adjustable Dipole](Collateral/27.%20%20Winch-and-APP-BlueBG-Small.png)



##### Inspiration
  - Interested in Antenna Physics since High School.
    - Particularly the concepts of Gain and Directivity when considering conservation of energy.
  - Recently interested in how Resonance and SWR affect Efficient Radiation.
  - Was surprised at how much better a friend’s antenna performed after a slight pruning.
    - We both noted how much better his dipole worked comparted to his G5RV or his HexBeam Spiderweb.
  - Began thinking of an “automatic” self-pruning-dipole.
  - Hangar Door Openers!  
    - Realized that a creatively constructed “Capstan” combined with a clothesline-like element geometry would simplify the mechanics.
    - Airplane hangar door openers use a wire and drum geometry, and are the mechanical inspiration for the prototypes.
  - Needed a good Winter Project during “Covid - Stay at home”.

##### Learning from Those That Have Gone Before.
  - Article by AE4YW – Radiation is more important than SWR.
  - The RTV 80 by W4QJP and KC4TAQ  is a proven example of a complete adjustable system (But manually operated with adjustable ropes).
  - VA2ERY used a literal incarnation of a clothesline to move the feed-point of a folded dipole.
    - (Simple, but requires a balanced feedline and a tuner.)
  - Collins Aerospace dual-drum winch for wire dipoles (Model 637-T1).
  - SteppIr.  Very successful stepper motor controlled Yagi’s, etc.
    - An automated – multi-element “Tape Measure” system if you look inside.


#### Status:  Two protoypes contructed and tested.  
  - Ready for constructive input and suggestions for improvment.  (More weatherproof?  Better / Simpler Stepper Control?  Etc?)
 

**Disclaimer:  I am a beginner with the tools I chose for this project, so it's as much a learning process as a production process.
  - I spent a lot of time quantifying and tuning my printer to make accurate parts.  The SCAD and STL files in this repostiory reflect
    pretty tight tolerances.  (The parts from my Prusa Mk3S had a nice friction fit and assembled without modification.)
    - (Parts printed on my friends Ender Pro wer a bit too bit and required a bit of sanding and filing.)
    - If you use the STL's, print the first three layers of a few of the parts to see if things are too tight.

#### Tools Used:
  - OpenSCAD.  Wanted to learn it.  Experienced TurboCad Deluxe user, but it lacks proper 3D tools.
    - Tried FreeCad, but found it combersome.  (Tried others, but like the program-like build proceess.  Minutes to first useful ogject.
  - TurboCad.  Useful for initial 2D design to get precise measurements.
  - Wifi-Stepper Controller:  As a beginner with stepper control, Advanced feactures like acceleration and crash detection wre beyond me.
    - The Wifi Stepper removes the comlexity of comprehensive control and also provides simple interaces.  HTML, Bash, and Mqtt.

# Initial Concept:

![All Band Adjustable Dipole](Collateral/1.%20%20Initial%20Concept.png)





# Animation of Kinematics
### Note that the wire (end at red dot) is wound out as a thin rope (Braided 60lb Fishing Line) is wound in (and in reverse).

![All Band Adjustable Dipole](Collateral/3.%20%20(Best%20Explaination!)%20System-Animated.mov)




# Animation of a Sample Application.  (Node-Red Dashboard)

- The Flow lets the user select a band, then fine adjust it.  
  - A simple function calcuates steps via simple math, and sends an absolute position to the motor. 
  
![All Band Adjustable Dipole](Collateral/6.%20%20Application%20Operation.mov)


# Bom:
  - (1) 8x22x7 MM sealed scateboard boaring
  - Assorted M3 screws and 16 thin sqaure M3 nuts.
    - (14) M3-10 Button Head Screws (or capscrews).
    - (4) M3-35 Button Head Screws (or capscrews).
    - (16) M3 562 (S2) Thin - Flat Square nuts.
    - (2) M3 hex nuts.
  - (2) Generic (Makita CB-303 in my case) power tool brushes.
  - ~ 130 feet of 18 guage tinned (less oxidation) wire.
  - ~ 260 feet of nylon or dacron 60lb test fishing line.
  - (4) pulleys (you can print them too), and some lightweight rope.
  - (2) 4mm x 1mm x 31mm copper strips.  (Wire guide slide surfaces.)
  - Glue compatible with plastic type.  (Top fasten top spool to middle spool.  Alignment pegs are on parts.)
    - Could add bosses and holes for screws on this part - was nervous about clearance for first unit. 
    - Bosses and holes on the improvment list.  (The part broke before the glue let go in my testing.)
  
  - Time to print:  ~40 hours.
  
  
  # Cutaway view of Internal Capstan Parts.
  
![All Band Adjustable Dipole](Collateral/11.%20Production%20Assembly%20Exploded.png)





# First Printed Parts
### Note:  First 3DP project! Trying different things.

![All Band Adjustable Dipole](Collateral/15.%20%20Parts%20Laid%20Out.JPG)





# Brush Cartridge
- External for easy replacement.
  - Wires from balun or coax connect to cartridge only.  (Hole in bottom)
  - Optional base can house a balun or other gear, wire feeds through botton of both parts to prevent water ingress.

![All Band Adjustable Dipole](Collateral/17.%20%20Cart%20Compared%20to%20Brush.JPG)





# Brush Cartridges in place (almost) with Pole Mount and Balun Housing in place.  
- Housing pushed in to show brush carts better!

![All Band Adjustable Dipole](Collateral/24.%20%20Brush-Carts-and-Pole-Mount.png)





# VNA (un-calibrated :-)  ) scanning 13Mhz to 15Mhz when antenna is tuned to 14.220 Mhz

![All Band Adjustable Dipole](Collateral/10.%20VNA%20-%20Antenna%20Tuned%20to%2014.220.jpg)




# Similar Antennas / Prior Work
- Collins 637t-1.
- Center Adjsutable Folded Clothsline Dipole.
- RTV 80 Inverted V.

![All Band Adjustable Dipole](Collateral/25.%20%20Similar-Designs.png)


# Winch / Controller Closup.

![All Band Adjustable Dipole](Collateral/2.%20%20Assembled%20Working%20System.png)


# Arrangment of commutators (brushes) with elements (wires).
- A few people have asked me why the brushes are on the "outside" of the capstan mechanism.
- One friend asked about the use of bare wire rather than insulated.
    - It turns out that the location of the brushes and the issues of insulated (or un-insulated) wire are related.

Early on, I had envisioned internal brushes on a commutating ring like an automotive alternator, 
with the use of insulated wire elements.
- I soon realised that the coiled-up element wires would make an excellent inductor at the frequencies we operate at.
- I was uncertain of how the brushes would wear, and how certain meterials might conduct at RF. 
    - I wanted to have an easy way to change them and experiment.
- Using un-unsulated wire and external brushes solved every fatal problem and only introducfed a couple of minor ones.
    _ (1.  Corrsion    2.  Loss of signal to things that touch the wire like leaves? )
    
Here are two diagrams I used to demonstrate the issues to a very smart friend.

Final design:
![All Band Adjustable Dipole](Collateral/Jim-1.png)

Contemplated design:
![All Band Adjustable Dipole](Collateral/Jim-2.png)


# It would be fun to model the "insulated wire - central commutator" design to see if it would be tunable across all bands with wierd  but shorter element lengths.
- Software could then pick the memorized lengths for each band with micro-tuning control still available.
- The coiled wire on spools could act as loading coils, with more coil at shorter elemenet lenths.



