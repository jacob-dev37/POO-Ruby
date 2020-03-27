#Programa que permite colorear textos
class Texto
    attr_accessor :contenido, :ver

    def initialize contenido
        @contenido = contenido
        @ver = contenido
        @color = {negro: 30, rojo: 31, verde: 32, marron: 33, azul: 34, violeta: 35, celeste: 36, blanco: 37}
        @fondo = {negro: 40, rojo: 41, verde: 42, amarillo: 43, azul: 44, violeta: 45, celeste: 46, blanco: 47}
    end

    def color color
        if @contenido.match(/\e\[\m/)
            @contenido = "\e[0;#{@color[color]}m#{@contenido}"
        else
            @contenido = "\e[0;#{@color[color]}m#{@contenido}\e[m"
        end
        @objeto = Texto.new(@contenido)
    end

    def fondo fondo
        if @contenido.match(/\e\[.;./)
            @contenido = @contenido.sub("m", "m\e[#{@fondo[fondo]}m")
        else
            @contenido = "\e[#{@fondo[fondo]}m#{@contenido}\e[m"
        end
        @objeto = Texto.new(@contenido)
    end

    def bold
        if @contenido.match(/\e\[.;./)
            @contenido = @contenido.sub("[0;", "[1;")
        end
        @objeto = Texto.new(@contenido)
    end

    def azul
        if @contenido.match(/\e\[\m/)
            @contenido = "\e[0;34m#{@contenido}"
        else
            @contenido = "\e[0;34m#{@contenido}\e[m"
        end
        @objeto = Texto.new(@contenido)
    end

    def verde
        if @contenido.match(/\e\[\m/)
            @contenido = "\e[0;32m#{@contenido}"
        else
            @contenido = "\e[0;32m#{@contenido}\e[m"
        end
        @objeto = Texto.new(@contenido)
    end
end

frase = Texto.new "Texto a ser coloreado"
puts frase.verde.bold.ver
