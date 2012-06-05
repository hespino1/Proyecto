module ReservasHelper

  def horas
    horas = []
    for i in 6..22
       if i <= 12
          horas << "#{i} am"
       else
          horas << "#{i-12} pm"
       end
    end
    horas

  end

  def deportes
    Dir.pwd
    deportes = []
    a = File.open('deportes.txt')
    a.each do |line|
      deportes << line
    end
    deportes

  end
end
