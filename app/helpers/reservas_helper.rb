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
end
