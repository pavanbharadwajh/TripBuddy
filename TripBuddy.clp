;----------------------------------------------------------------------------
;						  TRIP BUDDY SYSTEM
;----------------------------------------------------------------------------

;--------------------------TEMPLATE DEFINITION-------------------------------

(deftemplate travel (slot interest) (slot coast))
(deftemplate choices (slot destinationNumber)(slot range) )

;------------------------GLOBAL VARIABLES-------------------------

(defglobal ?*interest* = nil)
(defglobal ?*destinationNumber* = nil)
(defglobal ?*range* = nil)
(defglobal ?*coast* = nil)

;-------------------Defining Functions-----------------------
(deffunction get-interest()
    (printout t crlf "Please enter the season of year when you are plannin for the trip:" crlf)
        (printout t "For Fall destinations, type 'f' " crlf)
        (printout t "For Spring destinations, type 'sp' " crlf)
    	(printout t "For Summer destinations, type 's' " crlf)
        (printout t "For Winter destinations, type 'w'> ")
    (bind ?*interest* (read))
    (if (or (eq ?*interest* f) (eq ?*interest* sp)(eq ?*interest* s)(eq ?*interest* w))
        then 
    else 
    (printout t crlf "Invalid selection. Please choose only from the above mentioned list..!!" crlf)
      (get-interest))
)

(deffunction get-coast()
    (printout t crlf "Which one listed below intersts you the most in coast?" crlf)
    (printout t "For West Coast destinations, type 'W' " crlf)
    (printout t "For East Coast destinations, type 'E' " crlf)
    (printout t "Please Enter one of the coast Codes mentioned above (in capital letters)..> " crlf)
    (bind ?*coast* (read))
    (if (or (eq ?*coast* W) (eq ?*coast* E))
        then
     else
     (printout t crlf "Invalid Selection. Please choose only from the above mentioned list..!!" crlf)
     (get-coast))
)

(deffunction get-destination-number()
    (printout t crlf "Which one listed below intersts you the most?" crlf)
    (printout t "Please Enter one of the Destination Codes mentioned above (in capital letters)..> ")
    (bind ?*destinationNumber* (read))
    (if (or (eq ?*destinationNumber* FE1) (eq ?*destinationNumber* FW1) (eq ?*destinationNumber* FE2) (eq ?*destinationNumber* FW2) (eq ?*destinationNumber* SPE1) (eq ?*destinationNumber* SPW1) (eq ?*destinationNumber* SPE2) (eq ?*destinationNumber* SPW2) (eq ?*destinationNumber* SE1) (eq ?*destinationNumber* SW1)(eq ?*destinationNumber* SE2) (eq ?*destinationNumber* SW2) (eq ?*destinationNumber* WE1)(eq ?*destinationNumber* WW1)(eq ?*destinationNumber* WW2)(eq ?*destinationNumber* WE2))
       then
     else
     (printout t crlf "Invalid Selection. Please choose only from the above mentioned list..!!" crlf)
     (get-destination-number))
)
(deffunction get-price-range()
    (printout t crlf "Please select your price range:" crlf)
    	(printout t "For $1-$100, enter '1'" crlf)
        (printout t "For $100-$200, enter '2'> ")
    (bind ?*range* (read))
    (if (or (eq ?*range* 1) (eq ?*range* 2))
    	then
    else 
    (printout t crlf "Invalid Choice. Please choose only from the above mentioned list..!!" crlf)
	(get-price-range))
)


;-----------------------DEFINING THE RULES-------------------------

;-----------------------MODULE STARTUP-----------------------------
(defmodule startup)
(defrule print-banner
=>
(printout t crlf "Hey! Please type your name and press Enter> ")
(bind ?name (read))
(printout t crlf "********************************************************" crlf)
(printout t "Hello, " ?name "." crlf)
(printout t "Welcome to the Trip Buddy Application" crlf)
(printout t "A friend in need for planning your vacation." crlf)
(printout t "Lets start with knowing a bit more about you."crlf)
(printout t "Please answer the questions and enter your season of interest." crlf)
(printout t "I will tell you the best way to plan your vacation." crlf)
(printout t "********************************************************" crlf crlf))

;----------------------MODULE INPUT INTEREST--------------------------

(defmodule inputInterest)
(defrule intialize-interest
    =>
    (get-interest)
    (get-coast)
	(assert (travel (interest ?*interest*)(coast ?*coast*)))
)
;---------------------------------------------MODULE DESTINATION LIST DISPLAY---------------------------------------------------

(defmodule destinationListDisplay)
;-------------------------------------------------DESTINATION LISTINGS----------------------------------------------------------

(defrule fall_east
    (travel (interest f) (coast E))
    =>
    (printout t "" crlf)
    (printout t "Destination Code [FE1]: Asheville, North Carolina: plenty of area hiking trails" crlf)
    (printout t "------------------------------------------------------------------------------------------------" crlf)
    (printout t "Destination Code [FE2]: Damariscotta, Maine: Damariscotta River" crlf)
    (printout t "" crlf)
    )

(defrule fall_west
    (travel (interest f) (coast W))
    =>
    (printout t "" crlf)
    (printout t "Destination Code [FW1]: Las Vegas, Nevada: Party & entertainment shows." crlf)
    (printout t "------------------------------------------------------------------------------------------------" crlf)
    (printout t "Destination Code [FW2]: Big Sur, California: Redwood forests, Pristine coastline." crlf)
    (printout t "" crlf)
    )

(defrule spring_east
    (travel (interest sp) (coast E)) 
    =>
    (printout t "" crlf)
    (printout t "Destination Code [SPE1]: Tennessee/North Carolina: Great Smoky Mountains National Park." crlf)
    (printout t "-------------------------------------------------------------------------------------" crlf)
    (printout t "Destination Code [SPE2]: Florida: Sanibel Island." crlf)
    (printout t "" crlf)
    )

(defrule spring_west
    (travel (interest sp) (coast W)) 
    =>
    (printout t "" crlf)
    (printout t "Destination Code [SPW1]:  Pacific Coast Highway, California: Road Trip." crlf)
    (printout t "-------------------------------------------------------------------------------------" crlf)
    (printout t "Destination Code [SPW2]: Moloka’i, Hawaii: Breathtaking nature." crlf)
    (printout t "" crlf)
    )

(defrule summer_east
    (travel (interest s) (coast E)) 
    =>
    (printout t "" crlf)
    (printout t "Destination Code [SE1]: Boston, Massachusetts: Paul Revere House and Old North Church." crlf)
    (printout t "---------------------------------------------------------------------------------------------------" crlf)
    (printout t "Destination Code [SE2]: Seaside, Oregon:  Oceanfront promenade."crlf)
    (printout t "" crlf)
    )

(defrule summer_west
    (travel (interest s) (coast W)) 
    =>
    (printout t "" crlf)
    (printout t "Destination Code [SW1]: Big Bear Lake, California: Fishing, Paddle boarding, Kayaking ." crlf)
    (printout t "---------------------------------------------------------------------------------------------------" crlf)
    (printout t "Destination Code [SW2]: Ithaca, NewYork: Treman State Park."crlf)
    (printout t "" crlf)
    )

(defrule winter_east
    (travel (interest w) (coast E)) 
    =>
    (printout t "" crlf)
    (printout t "Destination Code [WE1]: Lenox, Massachusetts: Cross-Country skis, Scenic views of the Berkshires " crlf)
    (printout t "---------------------------------------------------------------------------------------------------" crlf)
    (printout t "Destination Code [WE2]: Key West, Florida: Ernest Hemingway Home & Museum, Florida Keys Eco-Discovery Center." crlf)
    (printout t "" crlf)
    )

(defrule winter_west
    (travel (interest w) (coast W)) 
    =>
    (printout t "" crlf)
    (printout t "Destination Code [WW1]: Yellowstone National Park, Wyoming: Cross-Country skis, Snowshoe Trek " crlf)
    (printout t "---------------------------------------------------------------------------------------------------" crlf)
    (printout t "Destination Code [WW2]: Waldport, Oregon: Fishing, Paddle boarding, Kayaking ." crlf)
    (printout t "" crlf)
    )

;-----------------------------------------------MODULE BOOKING OPTIONS-------------------------------------------------------

(defmodule bookingOptions)

(defrule options
    =>
    (get-destination-number)
    (get-price-range)
	(assert (choices (destinationNumber ?*destinationNumber*)  (range ?*range*) ))
    )

;----------------------------------------------MODULE BOOKING LISTINGS------------------------------------------------


(defmodule bookingListings)

 ;------------------------------------------------BOOKING RULES--------------------------------------------------------

;-------------------------------------------BOOKINGS FOR FALL SEASON -------------------------------------------------


(defrule FE1-1
    (choices (destinationNumber FE1)  (range 1) )
    =>
    (printout t "" crlf)
    (printout t "Hotel Rooms available at Holiday Inn Express & Suites @ $76 per night." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule FE1-2
    (choices (destinationNumber FE1)(range 2))
    =>
    (printout t "" crlf)
    (printout t "Rooms available at Renaissance Asheville Hotel from $120/night" crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule FE2-1
    (choices (destinationNumber FE2) (range 1))
    =>
    (printout t "" crlf)
    (printout t "Rooms available in Super 8 by Wyndham Monterey/Carmel $70/night" crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule FE2-2
    (choices (destinationNumber FE2) (range 2))
    =>
    (printout t "" crlf)
    (printout t "Hotel rooms available starting from $110/night at Comfort Inn Carmel By the Sea." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule FW1-1
    (choices (destinationNumber FW1)  (range 1) )
    =>
    (printout t "" crlf)
    (printout t "Hotel Rooms available at Caliente @ $94 per night." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule FW1-2
    (choices (destinationNumber FW1)(range 2))
    =>
    (printout t "" crlf)
    (printout t "Rooms available at West Wendover from $190/night" crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule FW2-1
    (choices (destinationNumber FW2) (range 1))
    =>
    (printout t "" crlf)
    (printout t "Rooms available in Vagabond's House Inn $70/night" crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule FW2-2
    (choices (destinationNumber FW2) (range 2))
    =>
    (printout t "" crlf)
    (printout t "Hotel rooms available starting from $143/night at The Colonial Terrace" crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

;-------------------------------------BOOKINGS FOR SPRING SEASON--------------------------------------------------


(defrule SPE1-1
    (choices (destinationNumber SPE1) (range 1))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $68/night available in Glenstone Lodge." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule SPE1-2
    (choices (destinationNumber SPE1)(range 2))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $109/night at Courtyard by Marriott Gatlinburg Downtown." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule SPE2-1
    (choices (destinationNumber SPE2)(range 1))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $56/night at Gulfview Studio." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule SPE2-2
    (choices (destinationNumber SPE2) (range 2))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $134/night at Island Inn." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
) 

(defrule SPW1-1
    (choices (destinationNumber SPW1) (range 1))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $56/night available in Studio 6 McCarran." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule SPW1-2
    (choices (destinationNumber SPW1)(range 2))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $123/night at Fallon RV Park." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule SPW2-1
    (choices (destinationNumber SPW2)(range 1))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $89/night at Molokai Shores." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule SPW2-2
    (choices (destinationNumber SPW2) (range 2))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $144/night at Island Inn." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

;-------------------------------------BOOKINGS FOR SUMMER SEASON --------------------------------------------------


(defrule SE1-1
    (choices (destinationNumber SE1) (range 1))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $78/night available in Ruby Room." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule SE1-2
    (choices (destinationNumber SE1)(range 2))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $108/night at Sheraton Boston Hotel." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule SE2-1
    (choices (destinationNumber SE2)(range 1))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $86/night at Quality Inn Seaside." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule SE2-2
    (choices (destinationNumber SE2) (range 2))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $166/night at Best Western Plus Ocean View Resort." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
) 

(defrule SW1-1
    (choices (destinationNumber SW1) (range 1))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $78/night available in Ruby Room." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule SW1-2
    (choices (destinationNumber SW1)(range 2))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $134/night at The Godfrey Hotel." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule SW2-1
    (choices (destinationNumber SW2)(range 1))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $86/night at Quality Inn Seaside." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule SW2-2
    (choices (destinationNumber SW2) (range 2))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $166/night at Harborside Inn." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
) 


;-------------------------------------BOOKINGS FOR WINTER SEASON--------------------------------------------------


(defrule WE1-1
    (choices (destinationNumber WE1) (range 1))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $87/night available in Lake Yellowstone Hotel." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule WE1-2
    (choices (destinationNumber WE1)(range 2))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $153/night at Grant Village" crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule WE2-1
    (choices (destinationNumber WE2)(range 1))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $56/night at Seashell Motel." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule WE2-2
    (choices  (destinationNumber WE2) (range 2))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $187/night at Key Lime Inn." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
) 

(defrule WW1-1
    (choices (destinationNumber WW1) (range 1))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $54/night available in Paddle Wheel Inn." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule WW1-2
    (choices (destinationNumber WW1)(range 2))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $153/night at The Westin Copley Place" crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule WW2-1
    (choices (destinationNumber WW2)(range 1))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $59/night at chateau lodge." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
)

(defrule WW2-2
    (choices  (destinationNumber WW2) (range 2))
    =>
    (printout t "" crlf)
    (printout t "Rooms starting from $187/night at Hyatt Regency ." crlf)
    (printout t "Enjoy your trip and have a pleasant stay!!")
    (printout t "" crlf)
) 

;------------------------------------------------------------------------------------------------------

(reset)

(focus startup inputInterest destinationListDisplay bookingOptions bookingListings)

(run)

