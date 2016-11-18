module Matching
  def add(item)
    # item contiene el elemento generado
    # item => { :ip => IP Object } 
    # tenemos que crear una variable llamada ip que contenga IP Object.
 
    option1 = erb(@template[:left], item)
    option2 = erb(@template[:right], item)

    @answers << [option1, option2]
  end

  def xml_questiontext(xml_builder)
    xml_builder.questiontext(:format => "html") do |qt|
      qt.text @description

      @answers.each do |option1, option2|
        qt.subquestion do |sq|
          sq.text option1
          sq.answer do |a|
            a.text option2
          end
        end
      end
    end
    xml_builder.shuffleanswers "true"
  end
end
