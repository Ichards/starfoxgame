

function getDrawCoords (currentCamera, trueCoords)

    local cameraPlaneX = 2 * (trueCoords.z / 0.2499954851)
    local preProjX = trueCoords.x - (currentCamera.x - (cameraPlaneX / 2))
    local drawX = (preProjX / cameraPlaneX) * currentCamera.resolutionX

    local cameraPlaneY = 2 * (trueCoords.z / 0.3333343258)
    local preProjY = trueCoords.y - (currentCamera.y - (cameraPlaneY / 2))
    local drawY = (preProjY / cameraPlaneY) * currentCamera.resolutionY

    local result = {drawX, drawY}

    return result

end


local camera = {}
camera.x = 400
camera.y = 300
camera.z = 0
camera.distance = 100
camera.resolutionY = 600
camera.resolutionX = 800
camera.innerAngleY = 143.13
camera.outerAngleY = 18.435
camera.outerAngleX = 14.036
camera.innerAngleX = 151.928


local ship = {}
ship.x = camera.x
ship.y = camera.y - 50
ship.z = 200
ship.head = {}
ship.head.p1 = {}
ship.head.p1.x = ship.x
ship.head.p1.y = ship.y
ship.head.p1.z = ship.z
ship.head.p2 = {}
ship.head.p2.x = ship.x - 100
ship.head.p2.y = ship.y
ship.head.p2.z = ship.z - 200
ship.head.p3 = {}
ship.head.p3.x = ship.x
ship.head.p3.y = ship.y
ship.head.p3.z = ship.z - 500
ship.head.p4 = {}
ship.head.p4.x = ship.x + 100
ship.head.p4.y = ship.y
ship.head.p4.z = ship.z - 200

ship.wingLeft = {}
ship.wingLeft.p1 = {}
ship.wingLeft.p1.x = ship.x
ship.wingLeft.p1.y = ship.y
ship.wingLeft.p1.z = ship.z
ship.wingLeft.p2 = {}
ship.wingLeft.p2.x = ship.x - 600
ship.wingLeft.p2.y = ship.y
ship.wingLeft.p2.z = ship.z + 200
ship.wingLeft.p3 = {}
ship.wingLeft.p3.x = ship.x - 200
ship.wingLeft.p3.y = ship.y
ship.wingLeft.p3.z = ship.z - 300

ship.wingRight = {}
ship.wingRight.p1 = {}
ship.wingRight.p1.x = ship.x
ship.wingRight.p1.y = ship.y
ship.wingRight.p1.z = ship.z
ship.wingRight.p2 = {}
ship.wingRight.p2.x = ship.x + 600
ship.wingRight.p2.y = ship.y
ship.wingRight.p2.z = ship.z + 200
ship.wingRight.p3 = {}
ship.wingRight.p3.x = ship.x + 200
ship.wingRight.p3.y = ship.y
ship.wingRight.p3.z = ship.z - 300

function love.update()

    ship.y = ship.y + 0.1

    ship.head.p1.x = ship.x
    ship.head.p1.y = ship.y
    ship.head.p1.z = ship.z
    ship.head.p2.x = ship.x - 100
    ship.head.p2.y = ship.y
    ship.head.p2.z = ship.z - 200
    ship.head.p3.x = ship.x
    ship.head.p3.y = ship.y - 200
    ship.head.p3.z = ship.z - 2000
    ship.head.p4.x = ship.x + 100
    ship.head.p4.y = ship.y
    ship.head.p4.z = ship.z - 200

    ship.wingLeft.p1.x = ship.x
    ship.wingLeft.p1.y = ship.y
    ship.wingLeft.p1.z = ship.z
    ship.wingLeft.p2.x = ship.x - 600
    ship.wingLeft.p2.y = ship.y
    ship.wingLeft.p2.z = ship.z + 200
    ship.wingLeft.p3.x = ship.x + 200
    ship.wingLeft.p3.y = ship.y
    ship.wingLeft.p3.z = ship.z - 300

    ship.wingRight.p1.x = ship.x
    ship.wingRight.p1.y = ship.y
    ship.wingRight.p1.z = ship.z
    ship.wingRight.p2.x = ship.x + 600
    ship.wingRight.p2.y = ship.y
    ship.wingRight.p2.z = ship.z + 200
    ship.wingRight.p3.x = ship.x - 200
    ship.wingRight.p3.y = ship.y
    ship.wingRight.p3.z = ship.z - 300

end

function love.draw()



    

    love.graphics.setLineJoin( 'none' )

    local points = {}
    points.head = {}
    points.head.p1 = getDrawCoords(camera, ship.head.p1)
    points.head.p2 = getDrawCoords(camera, ship.head.p2)
    points.head.p3 = getDrawCoords(camera, ship.head.p3)
    points.head.p4 = getDrawCoords(camera, ship.head.p4)

    points.wingLeft = {}
    points.wingLeft.p1 = getDrawCoords(camera, ship.wingLeft.p1)
    points.wingLeft.p2 = getDrawCoords(camera, ship.wingLeft.p2)
    points.wingLeft.p3 = getDrawCoords(camera, ship.wingLeft.p3)

    points.wingRight = {}
    points.wingRight.p1 = getDrawCoords(camera, ship.wingRight.p1)
    points.wingRight.p2 = getDrawCoords(camera, ship.wingRight.p2)
    points.wingRight.p3 = getDrawCoords(camera, ship.wingRight.p3)

    love.graphics.setColor(1, 0, 0, 1)

    love.graphics.polygon( 'line', points.head.p1[1], points.head.p1[2], points.head.p2[1], points.head.p2[2], points.head.p3[1], points.head.p3[2], points.head.p4[1], points.head.p4[2])
    love.graphics.setColor(0, 1, 0, 1)

    love.graphics.polygon( 'line', points.wingLeft.p1[1], points.wingLeft.p1[2], points.wingLeft.p2[1], points.wingLeft.p2[2], points.wingLeft.p3[1], points.wingLeft.p3[2])
    love.graphics.setColor(0, 0, 1, 1)

    love.graphics.polygon( 'line', points.wingRight.p1[1], points.wingRight.p1[2], points.wingRight.p2[1], points.wingRight.p2[2], points.wingRight.p3[1], points.wingRight.p3[2])
    love.graphics.setColor(1, 0, 1, 1)

    love.graphics.rectangle( 'fill', points.head.p3[1] - 3, points.head.p3[2] - 3, 6, 6)
    
    love.graphics.rectangle( 'fill', points.wingLeft.p1[1] - 3, points.wingLeft.p1[2] - 3, 6, 6)

    love.graphics.rectangle( 'fill', points.wingRight.p1[1] - 3, points.wingRight.p1[2] - 3, 6, 6)
    love.graphics.setColor(1, 1, 1, 1)

end

