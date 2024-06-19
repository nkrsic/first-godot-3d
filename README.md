# First3D 

This repo follows starter tutorials on 3D game programming with Godot. 

It uses Godot 3.6 

## Your First 3D Game - "Squash the Creeps"

- https://docs.godotengine.org/en/3.6/getting_started/first_3d_game/index.html

## Bouncing Ball Game

- https://www.youtube.com/watch?v=_7riD3FaZgI
- https://app.gumroad.com/d/5b49b366ee1aca4078a76b7bb24c0edb

## First Person Shooter features

- https://youtu.be/v4IEPi1c0eE?si=2kIBVtzNTXSexkPu - Bramwell
- https://youtu.be/xI_i2K9kAOw?si=HD3hImH4TGmNdzBV - StayAtHomeDev

# Colors

- Old orange-ish floor color: #d76565

# Transparent / Glassy Materials

SpatialMaterial
- Flags
	- Set 'Transparent'
	- Set 'Use Shadow to Opacity'

- Parameters
	- Diffuse Mode == Burley
	- Blend Mode == Mix OR Add
		- For the UV layer selected, triplanar enabled can 
		  add a frosted glass effect
	- Cull Mode == Front OR Back

- Metallic
	- Metallic ~0.1
	- Specular to taste in [0,1]

- Roughness
	- Roughness ~ 0.1

- NormalMap
	- Enabled
	- Fiddle with scale to taste

- Transmission
	- Enabled

- Fiddle with 'Refraction'
- Fiddle with 'Detail'
	- NoiseTexture under 'Mask' setting
	- OpenSimplexNoise
- Fiddle with Proximity Fade to taste
- Fiddle with Distance Fade to taste

- Baked Light
	- Enable 'Use in Baked Light' to taste


