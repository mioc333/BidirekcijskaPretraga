turtles-own [k p br-opcija smjer cijena pronaden]
patches-own [u1 u2 istrazen0 istrazen1]
globals [d1 d2 ra ax bx br-agenata br-crnih x y postotak0 postotak1]

to Setup
  ca
  set br-crnih 361

  lab

  ask patches [set istrazen0 0 set istrazen1 0]

  create-turtles 2
  [
    set color 45
    set heading 0
    set k 0
  ]
  ask turtle 0
  [
    setxy 1 17
    set color 95.1
    set heading 90
    set u1 254
    set istrazen0 1
  ]
  ask turtle 1
  [
    setxy 17 1
    set u2 254
    set istrazen1 1
  ]
  set d1 1
  set d2 1

  set br-agenata 2

end

to Play
  if algoritam = "Valna fronta" [valna-fronta]
  if algoritam = "Pohlepni" [pohlepni]
  if algoritam = "Random" [algoritam-random]
  if algoritam = "A*" [astar]
  if algoritam = "Dijkstraish" [dijkstraish]

  if algoritam = "Pohlepni-random" [pohlepni-random]
  if algoritam = "Pohlepni-A*" [pohlepni-A*]
  if algoritam = "Pohlepni-Dijkstraish" [pohlepni-dijkstraish]
  if algoritam = "Random-A*"[random-A*]
  if algoritam = "Random-Dijkstraish"[random-dijkstraish]
  if algoritam = "A*-Dijkstraish"[A*-dijkstraish]

  if algoritam = "Dijkstraish varijacija" [dijkstraish-varijacija]
end

;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------VALNA FRONTA---------

to valna-fronta

 vf1
 vf2

 ask turtle 0 [udaljenost1]
 if [p] of turtle 0 = 0 [stop]

 ask turtle 0
 [
    ifelse ([u1] of patch-ahead 1 < [u1] of patch-left-and-ahead 90 1 and [u1] of patch-ahead 1 < [u1] of patch-right-and-ahead 90 1) [fd 1 set k (k + 1)]
    [
      ifelse ([u1] of patch-left-and-ahead 90 1 < [u1] of patch-ahead 1 and [u1] of patch-left-and-ahead 90 1 < [u1] of patch-right-and-ahead 90 1) [lt 90 fd 1 set k (k + 1)]
      [
        ifelse ([u1] of patch-right-and-ahead 90 1 < [u1] of patch-left-and-ahead 90 1 and [u1] of patch-right-and-ahead 90 1 < [u1] of patch-ahead 1) [rt 90 fd 1 set k (k + 1)]
         [
           ifelse [u1] of patch-ahead 1 = [u1] of patch-left-and-ahead 90 1 and [u1] of patch-ahead 1 != [u1] of patch-right-and-ahead 90 1 [ifelse random 2 = 0 [fd 1 set k (k + 1)][lt 90 fd 1 set k (k + 1)]]
           [
             ifelse [u1] of patch-ahead 1 = [u1] of patch-right-and-ahead 90 1 and [u1] of patch-ahead 1 != [u1] of patch-left-and-ahead 90 1 [ifelse random 2 = 0 [fd 1 set k (k + 1)][rt 90 fd 1 set k (k + 1)]]
             [
               ifelse [u1] of patch-left-and-ahead 90 1 = [u1] of patch-right-and-ahead 90 1 and [u1] of patch-ahead 1 != [u1] of patch-right-and-ahead 90 1 [ifelse random 2 = 0 [rt 90 fd 1 set k (k + 1)][lt 90 fd 1 set k (k + 1)]]
               [
                 let r random 3
                 ifelse r = 0 [fd 1 set k (k + 1)]
                 [
                   ifelse r = 1 [lt 90 fd 1 set k (k + 1)]
                   [
                     rt 90 fd 1 set k (k + 1)
                   ]]]]]]]]
 ]

 ask turtle 0 [udaljenost1]
 if [p] of turtle 0 = 0 [stop]

 ask turtle 1
 [
    ifelse ([u2] of patch-ahead 1 < [u2] of patch-left-and-ahead 90 1 and [u2] of patch-ahead 1 < [u2] of patch-right-and-ahead 90 1) [fd 1 set k (k + 1)]
    [
      ifelse ([u2] of patch-left-and-ahead 90 1 < [u2] of patch-ahead 1 and [u2] of patch-left-and-ahead 90 1 < [u2] of patch-right-and-ahead 90 1) [lt 90 fd 1 set k (k + 1)]
      [
        ifelse ([u2] of patch-right-and-ahead 90 1 < [u2] of patch-left-and-ahead 90 1 and [u2] of patch-right-and-ahead 90 1 < [u2] of patch-ahead 1) [rt 90 fd 1 set k (k + 1)]
         [
           ifelse [u2] of patch-ahead 1 = [u2] of patch-left-and-ahead 90 1 and [u2] of patch-ahead 1 != [u2] of patch-right-and-ahead 90 1 [ifelse random 2 = 0 [fd 1 set k (k + 1)][lt 90 fd 1 set k (k + 1)]]
           [
             ifelse [u2] of patch-ahead 1 = [u2] of patch-right-and-ahead 90 1 and [u2] of patch-ahead 1 != [u2] of patch-left-and-ahead 90 1 [ifelse random 2 = 0 [fd 1 set k (k + 1)][rt 90 fd 1 set k (k + 1)]]
             [
               ifelse [u2] of patch-left-and-ahead 90 1 = [u2] of patch-right-and-ahead 90 1 and [u2] of patch-ahead 1 != [u2] of patch-right-and-ahead 90 1 [ifelse random 2 = 0 [rt 90 fd 1 set k (k + 1)][lt 90 fd 1 set k (k + 1)]]
               [
                 let r random 3
                 ifelse r = 0 [fd 1 set k (k + 1)]
                 [
                   ifelse r = 1 [lt 90 fd 1 set k (k + 1)]
                   [
                     rt 90 fd 1 set k (k + 1)
                   ]]]]]]]]
 ]

  ask turtle 0 [set istrazen0 1]
  ask turtle 1 [set istrazen1 1]
end

to vf1
  ask patches with [pxcor = [xcor] of turtle 1 and pycor = [ycor] of turtle 1][set u1 1 ]
  ask patches with [pcolor != black][set u1 255]
  while [any? patches with [u1 = 0]]
  [
    ask patches with [u1 = d1][ask neighbors4 with [u1 = 0][set u1 d1 + 1]]
    set d1 d1 + 1
  ]
end

to vf2
  ask patches with [pxcor = [xcor] of turtle 0 and pycor = [ycor] of turtle 0][set u2 1 ]
  ask patches with [pcolor != black][set u2 255]
  while [any? patches with [u2 = 0]]
  [
    ask patches with [u2 = d2][ask neighbors4 with [u2 = 0][set u2 d2 + 1]]
    set d2 d2 + 1
  ]
end

;------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------POHLEPNI------------

to pohlepni

  ; korak za 0

  ask turtle 0 [udaljenost1]
  if [p] of turtle 0 = 0 [stop]

  ask turtle 0
  [
    provjera
    deadend
  ]

  ifelse [br-opcija] of turtle 0 = 1
  [
    ask turtle 0 [hodnik]
  ]
  [
    ask turtle 0
    [
      cvor
      izbor-pohlepni
    ]
    ask turtles with [who > 1] [ die ]
  ]

  ; korak za 1

  ask turtle 0 [udaljenost1]
  if [p] of turtle 0 = 0 [stop]

  ask turtle 1
  [
    provjera
    deadend
  ]

  ifelse [br-opcija] of turtle 1 = 1
  [
    ask turtle 1 [hodnik]
  ]
  [
    ask turtle 1
    [
      cvor
      izbor-pohlepni
    ]
    ask turtles with [who > 1] [ die ]
  ]

  ask turtle 0 [set istrazen0 1]
  ask turtle 1 [set istrazen1 1]
end

to udaljenost1
  set p (abs(pxcor - (first [pxcor] of patches with [pxcor = [xcor] of turtle 1 and pycor = [ycor] of turtle 1])) + abs(pycor - first [pycor] of patches with [pxcor = [xcor] of turtle 1 and pycor = [ycor] of turtle 1]))
end

to udaljenost2
  set p (abs(pxcor - (first [pxcor] of patches with [pxcor = [xcor] of turtle 0 and pycor = [ycor] of turtle 0])) + abs(pycor - first [pycor] of patches with [pxcor = [xcor] of turtle 0 and pycor = [ycor] of turtle 0]))
end

to provjera
  set br-opcija 0

  if [pcolor] of patch-left-and-ahead 90 1 = black
  [
    set br-opcija (br-opcija + 1)
  ]

  if [pcolor] of patch-ahead 1 = black
  [
    set br-opcija (br-opcija + 1)
  ]

  if [pcolor] of patch-right-and-ahead 90 1 = black
  [
    set br-opcija (br-opcija + 1)
  ]
end

to hodnik
  (
  ifelse
    [pcolor] of patch-left-and-ahead 90 1 = black
    [
      lt 90 fd 1
      set k (k + 1)
    ]
    [pcolor] of patch-ahead 1 = black
    [
      fd 1
      set k (k + 1)
    ]
    [pcolor] of patch-right-and-ahead 90 1 = black
    [
      rt 90 fd 1
      set k (k + 1)
    ]
  )
end

to cvor
  if [pcolor] of patch-left-and-ahead 90 1 = black
  [
    hatch 1
    [
      lt 90 fd 1
      set k 1
      set smjer 1
      set br-agenata (br-agenata + 1)

      provjera

      while [br-opcija = 1]
      [
        hodnik
        provjera
      ]
    ]
  ]

  if [pcolor] of patch-ahead 1 = black
  [
    hatch 1
    [
      fd 1
      set k 1
      set smjer 2
      set br-agenata (br-agenata + 1)

      provjera

      while [br-opcija = 1]
      [
        hodnik
        provjera
      ]
    ]
  ]

  if [pcolor] of patch-right-and-ahead 90 1 = black
  [
    hatch 1
    [
      rt 90 fd 1
      set k 1
      set smjer 3
      set br-agenata (br-agenata + 1)

      provjera

      while [br-opcija = 1]
      [
        hodnik
        provjera
      ]
    ]
  ]
end

to izbor-pohlepni
  (
  ifelse
    [smjer] of first sort-on [k] turtles with [who != 1 and who != 0] = 1 [lt 90 fd 1]
    [smjer] of first sort-on [k] turtles with [who != 1 and who != 0] = 2 [fd 1]
    [smjer] of first sort-on [k] turtles with [who != 1 and who != 0] = 3 [rt 90 fd 1]
  )
end

;------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------RANDOM--------------

to algoritam-random

  ; korak za 0

  ask turtle 0 [udaljenost1]
  if [p] of turtle 0 = 0 [stop]

  ask turtle 0
  [
    provjera
    deadend
  ]

  ifelse [br-opcija] of turtle 0 = 1
  [
    ask turtle 0 [hodnik]
  ]
  [
    ask turtle 0 [random-korak]
  ]

  ; korak za 1

  ask turtle 0 [udaljenost1]
  if [p] of turtle 0 = 0 [stop]

  ask turtle 1
  [
    provjera
    deadend
  ]

  ifelse [br-opcija] of turtle 1 = 1
  [
    ask turtle 1 [hodnik]
  ]
  [
    ask turtle 1 [random-korak]
  ]

  ask turtle 0 [set istrazen0 1]
  ask turtle 1 [set istrazen1 1]
end

to random-korak
  ifelse br-opcija = 3
  [
    set ra one-of [0 1 2]
  ]
  [
    if [pcolor != black ] of patch-left-and-ahead 90 1 [set ra one-of [1 2]]
    if [pcolor != black] of patch-ahead 1 [set ra one-of [0 2]]
    if [pcolor != black] of patch-right-and-ahead 90 1 [set ra one-of [0 1]]
  ]

  if ra = 0 [lt 90 fd 1]
  if ra = 1 [fd 1]
  if ra = 2 [rt 90 fd 1]
end

;------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ASTAR---------------

to astar

  ; korak za 0

  ask turtle 0 [udaljenost1]
  if [p] of turtle 0 = 0 [stop]

  ask turtle 0
  [
    provjera
    deadend
  ]
  ifelse [br-opcija] of turtle 0 = 1
  [
    ask turtle 0 [hodnik]
  ]
  [
    ask turtle 0
    [
      cvor
      ask turtles with [who != 1 and who != 0]
      [
        udaljenost1
        fja-cijene
      ]
      izbor-astar
    ]
    ask turtles with [who > 1] [ die ]
  ]

  ; korak za 1

  ask turtle 0 [udaljenost1]
  if [p] of turtle 0 = 0 [stop]

  ask turtle 1
  [
    provjera
    deadend
  ]

  ifelse [br-opcija] of turtle 1 = 1
  [
    ask turtle 1 [hodnik]
  ]
  [
    ask turtle 1
    [
      cvor
      ask turtles with [who != 1 and who != 0]
      [
        udaljenost1
        fja-cijene
      ]
      izbor-astar
    ]
    ask turtles with [who > 1] [ die ]
  ]

  ask turtle 0 [set istrazen0 1]
  ask turtle 1 [set istrazen1 1]
end

to izbor-astar
  (
  ifelse
    [smjer] of first sort-on [cijena] turtles with [who != 1 and who != 0] = 1 [lt 90 fd 1]
    [smjer] of first sort-on [cijena] turtles with [who != 1 and who != 0] = 2 [fd 1]
    [smjer] of first sort-on [cijena] turtles with [who != 1 and who != 0] = 3 [rt 90 fd 1]
  )
end

to fja-cijene
  set cijena (k + p)
end

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------Dijkstraish--------------------------

to dijkstraish

  ; korak za 0

  ask turtle 0 [udaljenost1]
  if [p] of turtle 0 = 0 [stop]

  ask turtle 0
  [
    provjera
    deadend
  ]

  ifelse [br-opcija] of turtle 0 = 1
  [
    ask turtle 0 [hodnik]
  ]
  [
    ask turtle 0
    [
      cvor-prvi
      izbor-dijkstraish
    ]
    ask turtles with [who > 1] [ die ]
  ]

  ; korak za 1

  ask turtle 0 [udaljenost1]
  if [p] of turtle 0 = 0 [stop]

  ask turtle 1
  [
    provjera
    deadend
  ]

  ifelse [br-opcija] of turtle 1 = 1
  [
    ask turtle 1 [hodnik]
  ]
  [
    ask turtle 1
    [
      cvor-prvi
      izbor-dijkstraish
    ]
    ask turtles with [who > 1] [ die ]
  ]

  ask turtle 0 [set istrazen0 1]
  ask turtle 1 [set istrazen1 1]
end

to cvor-prvi
  if [pcolor] of patch-left-and-ahead 90 1 = black
  [
    hatch 1
    [
      lt 90 fd 1
      set k 1
      set smjer 1
      set br-agenata (br-agenata + 1)
      set pronaden 0

      provjera

      while [br-opcija = 1]
      [
        hodnik
        udaljenost1
        if p = 0 [set pronaden 1]
        udaljenost2
        if p = 0 [set pronaden 1]
        provjera
      ]

      deadend
      cvor-drugi
      die
    ]
  ]

  if [pcolor] of patch-ahead 1 = black
  [
    hatch 1
    [
      fd 1
      set k 1
      set smjer 2
      set br-agenata (br-agenata + 1)
      set pronaden 0

      provjera

      while [br-opcija = 1]
      [
        hodnik
        udaljenost1
        if p = 0 [set pronaden 1]
        udaljenost2
        if p = 0 [set pronaden 1]
        provjera
      ]

      deadend
      cvor-drugi
      die
    ]
  ]

  if [pcolor] of patch-right-and-ahead 90 1 = black
  [
    hatch 1
    [
      rt 90 fd 1
      set k 1
      set smjer 3
      set br-agenata (br-agenata + 1)
      set pronaden 0

      provjera

      while [br-opcija = 1]
      [
        hodnik
        udaljenost1
        if p = 0 [set pronaden 1]
        udaljenost2
        if p = 0 [set pronaden 1]
        provjera
      ]

      deadend
      cvor-drugi
      die
    ]
  ]
end

to cvor-drugi
  if [pcolor] of patch-left-and-ahead 90 1 = black
  [
    hatch 1
    [
      lt 90 fd 1
      set br-agenata (br-agenata + 1)

      provjera

      while [br-opcija = 1]
      [
        hodnik
        udaljenost1
        if p = 0 [set pronaden 1]
        udaljenost2
        if p = 0 [set pronaden 1]
        provjera
      ]
    ]
  ]

  if [pcolor] of patch-ahead 1 = black
  [
    hatch 1
    [
      fd 1
      set br-agenata (br-agenata + 1)

      provjera

      while [br-opcija = 1]
      [
        hodnik
        udaljenost1
        if p = 0 [set pronaden 1]
        udaljenost2
        if p = 0 [set pronaden 1]
        provjera
      ]
    ]
  ]

  if [pcolor] of patch-right-and-ahead 90 1 = black
  [
    hatch 1
    [
      rt 90 fd 1
      set br-agenata (br-agenata + 1)

      provjera

      while [br-opcija = 1]
      [
        hodnik
        udaljenost1
        if p = 0 [set pronaden 1]
        udaljenost2
        if p = 0 [set pronaden 1]
        provjera
      ]
    ]
  ]
end

to izbor-dijkstraish
  ifelse [smjer] of first sort-on [k] turtles with [who != 1 and who != 0] = 1
  [
    lt 90 fd 1
  ]
  [
    ifelse [smjer] of first sort-on [k] turtles with [who != 1 and who != 0] = 2
    [
      fd 1
    ]
    [
      if [smjer] of first sort-on [k] turtles with [who != 1 and who != 0] = 3
      [
        rt 90 fd 1
      ]
    ]
  ]
end

;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

to deadend
  if br-opcija = 0
  [
    set heading (heading + 180)
    set br-opcija 1
  ]
end

to lab
  let linija 0
  let datoteka (word "./Mazes/maze_002_000_" maze-num ".lab")
  file-open datoteka
  while [not file-at-end?]
  [
  set linija file-read-line
  ifelse item 0 linija = "1"
    [
      while [ax != 19]
      [
        if item ax linija = "1"
        [
          ask patches with [pxcor = ax and pycor = bx - 2]
          [
            set pcolor violet
            set br-crnih (br-crnih - 1)
          ]
        ]

        if item ax linija = "S"
        [
          ask patches with [pxcor = ax and pycor = bx - 2]
          [
            set pcolor black
          ]
        ]

        set ax (ax + 1)
      ]
      set ax 0
      set bx (bx + 1)
    ]
    [
      set bx (bx + 1)
    ]
  ]
  file-close
end

to-report koraci
  report [k] of turtle 0 + [k] of turtle 1
end

to-report cilj
  ask turtle 0 [udaljenost1]
  ifelse [p] of turtle 0 = 0
  [report true]
  [report false]
end

to-report agenti
  report br-agenata
end

to-report prostor0
  report count patches with [istrazen0 = 1] / count patches with [pcolor = black] * 100
end

to-report prostor1
  report count patches with [istrazen1 = 1] / count patches with [pcolor = black] * 100
end

;------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------POHLEPNI-RANDOM------------

to pohlepni-random

  ; korak za 0

  ask turtle 0 [udaljenost1]
  if [p] of turtle 0 = 0 [stop]

  ask turtle 0
  [
    provjera
    deadend
  ]

  ifelse [br-opcija] of turtle 0 = 1
  [
    ask turtle 0 [hodnik]
  ]
  [
    ask turtle 0
    [
      cvor
      izbor-pohlepni
    ]
    ask turtles with [who > 1] [ die ]
  ]


  ; korak za 1

  ask turtle 0 [udaljenost1]
  if [p] of turtle 0 = 0 [stop]

  ask turtle 1
  [
    provjera
    deadend
  ]

  ifelse [br-opcija] of turtle 1 = 1
  [
    ask turtle 1 [hodnik]
  ]
  [
    ask turtle 1 [random-korak]
  ]

  ask turtle 0 [set istrazen0 1]
  ask turtle 1 [set istrazen1 1]


end


;------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------POHLEPNI-A*------------

to pohlepni-A*

  ; korak za 0

  ask turtle 0 [udaljenost1]
  if [p] of turtle 0 = 0 [stop]

  ask turtle 0
  [
    provjera
    deadend
  ]

  ifelse [br-opcija] of turtle 0 = 1
  [
    ask turtle 0 [hodnik]
  ]
  [
    ask turtle 0
    [
      cvor
      izbor-pohlepni
    ]
    ask turtles with [who > 1] [ die ]
  ]



  ; korak za 1

  ask turtle 0 [udaljenost1]
  if [p] of turtle 0 = 0 [stop]

  ask turtle 1
  [
    provjera
    deadend
  ]

  ifelse [br-opcija] of turtle 1 = 1
  [
    ask turtle 1 [hodnik]
  ]
  [
    ask turtle 1
    [
      cvor
      ask turtles with [who != 1 and who != 0][udaljenost1 fja-cijene]
      izbor-astar
    ]
    ask turtles with [who > 1] [ die ]
  ]

  ask turtle 0 [set istrazen0 1]
  ask turtle 1 [set istrazen1 1]
end



;------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------POHLEPNI-DIJKSTRAISH------------

to pohlepni-dijkstraish

  ; korak za 0

  ask turtle 0 [udaljenost1]
  if [p] of turtle 0 = 0 [stop]

  ask turtle 0
  [
    provjera
    deadend
  ]

  ifelse [br-opcija] of turtle 0 = 1
  [
    ask turtle 0 [hodnik]
  ]
  [
    ask turtle 0
    [
      cvor
      izbor-pohlepni
    ]
    ask turtles with [who > 1] [ die ]
  ]


  ; korak za 1

  ask turtle 0 [udaljenost1]
  if [p] of turtle 0 = 0 [stop]

  ask turtle 1
  [
    provjera
    deadend
  ]

  ifelse [br-opcija] of turtle 1 = 1
  [
    ask turtle 1 [hodnik]
  ]
  [
    ask turtle 1
    [
      cvor-prvi
      izbor-dijkstraish
    ]
    ask turtles with [who > 1] [ die ]
  ]

  ask turtle 0 [set istrazen0 1]
  ask turtle 1 [set istrazen1 1]
end



;------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------Random-A*------------

to random-A*

; korak za 0

  ask turtle 0 [udaljenost1]
  if [p] of turtle 0 = 0 [stop]

  ask turtle 0
  [
    provjera
    deadend
  ]

  ifelse [br-opcija] of turtle 0 = 1
  [
    ask turtle 0 [hodnik]
  ]
  [
    ask turtle 0 [random-korak]
  ]

  ; korak za 1

  ask turtle 0 [udaljenost1]
  if [p] of turtle 0 = 0 [stop]

  ask turtle 1
  [
    provjera
    deadend
  ]

  ifelse [br-opcija] of turtle 1 = 1
  [
    ask turtle 1 [hodnik]
  ]
  [
    ask turtle 1
    [
      cvor
      ask turtles with [who != 1 and who != 0][udaljenost1 fja-cijene]
      izbor-astar
    ]
    ask turtles with [who > 1] [ die ]
  ]

  ask turtle 0 [set istrazen0 1]
  ask turtle 1 [set istrazen1 1]
end

;------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------Random-Dijkstraish------------

to random-dijkstraish
  ; korak za 0

  ask turtle 0 [udaljenost1]
  if [p] of turtle 0 = 0 [stop]

  ask turtle 0
  [
    provjera
    deadend
  ]

  ifelse [br-opcija] of turtle 0 = 1
  [
    ask turtle 0 [hodnik]
  ]
  [
    ask turtle 0 [random-korak]
  ]

   ; korak za 1

  ask turtle 0 [udaljenost1]
  if [p] of turtle 0 = 0 [stop]

  ask turtle 1
  [
    provjera
    deadend
  ]

  ifelse [br-opcija] of turtle 1 = 1
  [
    ask turtle 1 [hodnik]
  ]
  [
    ask turtle 1
    [
      cvor-prvi
      izbor-dijkstraish
    ]
    ask turtles with [who > 1] [ die ]
  ]

  ask turtle 0 [set istrazen0 1]
  ask turtle 1 [set istrazen1 1]

end

;------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------A*-Dijkstraish------------

to A*-dijkstraish
  ; korak za 0

  ask turtle 0 [udaljenost1]
  if [p] of turtle 0 = 0 [stop]

  ask turtle 0
  [
    provjera
    deadend
  ]
  ifelse [br-opcija] of turtle 0 = 1
  [
    ask turtle 0 [hodnik]
  ]
  [
    ask turtle 0
    [
      cvor
      ask turtles with [who != 1 and who != 0][udaljenost1 fja-cijene]
      izbor-astar
    ]
    ask turtles with [who > 1] [ die ]
  ]

   ; korak za 1

  ask turtle 0 [udaljenost1]
  if [p] of turtle 0 = 0 [stop]

  ask turtle 1
  [
    provjera
    deadend
  ]

  ifelse [br-opcija] of turtle 1 = 1
  [
    ask turtle 1 [hodnik]
  ]
  [
    ask turtle 1
    [
      cvor-prvi
      izbor-dijkstraish
    ]
    ask turtles with [who > 1] [ die ]
  ]

  ask turtle 0 [set istrazen0 1]
  ask turtle 1 [set istrazen1 1]

end

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------Dijkstraish-varijacija--------------------------

to dijkstraish-varijacija

  ; korak za 0

  ask turtle 0 [udaljenost1]
  if [p] of turtle 0 = 0 [stop]

  ask turtle 0
  [
    provjera
    deadend
  ]

  ifelse [br-opcija] of turtle 0 = 1
  [
    ask turtle 0 [hodnik]
  ]
  [
    ask turtle 0
    [
      cvor-prvi
      izbor-dijkstraish-varijacija
    ]
    ask turtles with [who > 1] [ die ]
  ]

  ; korak za 1

  ask turtle 0 [udaljenost1]
  if [p] of turtle 0 = 0 [stop]

  ask turtle 1
  [
    provjera
    deadend
  ]

  ifelse [br-opcija] of turtle 1 = 1
  [
    ask turtle 1 [hodnik]
  ]
  [
    ask turtle 1
    [
      cvor-prvi
      izbor-dijkstraish-varijacija
    ]
    ask turtles with [who > 1] [ die ]
  ]

  ask turtle 0 [set istrazen0 1]
  ask turtle 1 [set istrazen1 1]
end

to izbor-dijkstraish-varijacija

  ifelse [pronaden] of turtles with [who != 1 and who != 0] = 0
  [
    izbor-dijkstraish
  ]
  [
    ifelse [smjer] of first sort-on [k] turtles with [who != 1 and who != 0 and pronaden = 1] = 1
    [
      lt 90 fd 1
    ]
    [
      ifelse [smjer] of first sort-on [k] turtles with [who != 1 and who != 0 and pronaden = 1] = 2
      [
        fd 1
      ]
      [
        if [smjer] of first sort-on [k] turtles with [who != 1 and who != 0 and pronaden = 1] = 3
        [
          rt 90 fd 1
        ]
      ]
    ]
  ]

end
@#$#@#$#@
GRAPHICS-WINDOW
210
10
788
589
-1
-1
30.0
1
10
1
1
1
0
1
1
1
0
18
0
18
0
0
1
ticks
30.0

BUTTON
60
85
141
118
NIL
Setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
59
198
139
232
NIL
Play
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

CHOOSER
37
139
195
184
algoritam
algoritam
"Valna fronta" "Pohlepni" "Random" "A*" "Dijkstraish" "Pohlepni-random" "Pohlepni-A*" "Pohlepni-Dijkstraish" "Random-A*" "Random-Dijkstraish" "A*-Dijkstraish" "Dijkstraish varijacija"
0

SLIDER
21
251
193
284
maze-num
maze-num
1
100
33.0
1
1
NIL
HORIZONTAL

MONITOR
37
317
94
362
Cilj
cilj
17
1
11

MONITOR
36
373
111
418
Broj koraka
koraci
17
1
11

MONITOR
37
431
122
476
Broj agenata
agenti
17
1
11

MONITOR
37
487
170
532
Postotak istrazenog 0
prostor0
2
1
11

MONITOR
38
544
171
589
Postotak istrazenog 1
prostor1
2
1
11

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.1.0
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
<experiments>
  <experiment name="test0" repetitions="1" runMetricsEveryStep="false">
    <setup>Setup</setup>
    <go>Play</go>
    <timeLimit steps="1000"/>
    <metric>cilj</metric>
    <metric>koraci</metric>
    <metric>agenti</metric>
    <metric>prostor0</metric>
    <metric>prostor1</metric>
    <steppedValueSet variable="maze-num" first="1" step="1" last="100"/>
    <enumeratedValueSet variable="algoritam">
      <value value="&quot;Valna fronta&quot;"/>
      <value value="&quot;Pohlepni&quot;"/>
      <value value="&quot;A*&quot;"/>
      <value value="&quot;Random&quot;"/>
      <value value="&quot;Dijkstraish&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="test1" repetitions="1" runMetricsEveryStep="true">
    <setup>Setup</setup>
    <go>Play</go>
    <timeLimit steps="1000"/>
    <metric>cilj</metric>
    <metric>koraci</metric>
    <metric>agenti</metric>
    <metric>prostor0</metric>
    <metric>prostor1</metric>
    <steppedValueSet variable="maze-num" first="1" step="1" last="100"/>
    <enumeratedValueSet variable="algoritam">
      <value value="&quot;Pohlepni-random&quot;"/>
      <value value="&quot;Pohlepni-A*&quot;"/>
      <value value="&quot;Pohlepni-Dijkstraish&quot;"/>
      <value value="&quot;Random-A*&quot;"/>
      <value value="&quot;Random-Dijkstraish&quot;"/>
      <value value="&quot;A*-Dijkstraish&quot;"/>
    </enumeratedValueSet>
  </experiment>
</experiments>
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
