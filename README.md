# lunar-classes
A Lua module for OOP

## Example
```
require "lunarclasses"


--------------------------------------------------

Vehicle = lunarclasses.create_class()  -- creates a Vehicle class
function Vehicle:sound(s)
    print(s)
end

Vehicle.owner = "Paul"

--------------------------------------------------

Boat = lunarclasses.create_class({ Vehicle })  -- you can specify a list of superclasses for a subclass
function Boat:action()
    print("Swim")
end

function Boat:capacity()
    print("4 persons")
end

--------------------------------------------------

Airplane = lunarclasses.create_class({ Vehicle })
function Airplane:action()
    print("Fly")
end

function Airplane:max_speed()
    print("850 km/h")
end

--------------------------------------------------

Flying_Boat = lunarclasses.create_class({ Boat, Airplane })  -- multiple inheritance is also supported
function Flying_Boat:action()
    print("Swim and fly")
end

Flying_Boat.static.count = 10  -- you can access static fields of a class this way
--------------------------------------------------

flying_boat = Flying_Boat:new()  -- creates an instance of Flying_Boat

flying_boat:sound("Vroom!")            -- inherited from Vehicle
flying_boat:action()                   -- overridden by Flying_Boat
flying_boat:capacity()                 -- inherited from Boat
flying_boat:max_speed()                -- inherited from Airplane
print("Owner: " .. flying_boat.owner)  -- inherited from Vehicle


flying_boat.super[1].action()  -- Boat's version of action()


flying_boat2 = Flying_Boat:new()
flying_boat2.static.count = 15

print("flying_boat's version: " .. flying_boat.static.count)
print("flying_boat2's version: " .. flying_boat2.static.count)  -- both are equal to 15
```

## Output
```
Vroom!
Swim and fly
4 persons
850 km/h
Owner: Paul
Swim
flying_boat's version: 15
flying_boat2's version: 15
```

## Usage
Copy lunarclasses.lua to your project folder, then write this to include the module:
```
require "lunarclasses"
```
