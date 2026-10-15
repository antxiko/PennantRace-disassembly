# omsx_vram.tcl - Vuelca la VRAM (128 KB), los registros, la paleta y unos
# bytes de RAM del Pro Yakyuu en un MSX2 (C-BIOS_MSX2_JP), para cotejar los
# dibujos de tools/pantallas.py (tools/coteja_vram.py). No se pulsa nada: tras
# la presentacion y el menu, el juego entra solo en la demostracion.
#
#   "C:/Program Files/openMSX/openmsx.exe" -machine C-BIOS_MSX2_JP \
#       -cart pennantrace.rom -romtype KonamiSCC -script tools/omsx_vram.tcl
#
# Variables: VRAM_SALIDA (work/omsx), VRAM_TIEMPOS ("30 45 60": segundos
# emulados de cada volcado; sale despues del ultimo).
proc opcion {nombre porDefecto} {
    global env
    if {[info exists env($nombre)]} { return $env($nombre) }
    return $porDefecto
}
set ::SALIDA [opcion VRAM_SALIDA {work/omsx}]
set ::TIEMPOS [opcion VRAM_TIEMPOS {30 45 60}]
file mkdir $::SALIDA

proc vuelca {etiqueta} {
    set f [open [file join $::SALIDA "vram-$etiqueta.bin"] wb]
    fconfigure $f -translation binary
    puts -nonewline $f [debug read_block VRAM 0 131072]
    close $f
    set g [open [file join $::SALIDA "vdp-$etiqueta.txt"] w]
    for {set i 0} {$i < 47} {incr i} {
        puts $g [format "R%d = 0x%02X" $i [debug read "VDP regs" $i]]
    }
    for {set i 0} {$i < 16} {incr i} {
        puts $g [format "P%d = 0x%03X" $i [getcolor $i]]
    }
    # el estado y el paso (0xDE00), el desplazamiento (0xE1A2) y la zona (0xE1A6)
    foreach {nombre d} {estado 0xDE00 paso 0xDE01 desp_l 0xE1A2 desp_h 0xE1A3 zona 0xE1A6} {
        puts $g [format "%s = 0x%02X" $nombre [debug read memory $d]]
    }
    close $g
    screenshot [file join $::SALIDA "ver-$etiqueta.png"]
}
foreach t $::TIEMPOS { after time $t "vuelca $t" }
after time [expr {[lindex $::TIEMPOS end] + 1}] exit
