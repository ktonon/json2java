# This is the json2java generator
require 'json'

class JavaClass
  
  attr_reader :methods
  
  def initialize(data)
    @data = data
    @methods = data["methods"].collect {|d| JavaMethod.new d}
  end
  
  def name
    @data["classname"]
  end
end

class JavaMethod
  
  def initialize(data)
    @data = data
  end
  
  def name
    @data["name"]
  end
  
  def params
    @data["params"].collect do |pdata|
      "#{pdata["type"]} #{pdata["name"]}"
    end.join ', '
  end
  
  def signature
    "#{@data["rtype"]} #{name}(#{params})"
  end
end

json_filename = File.join Cog.project_root, 'json', 'sample.json'
json_data = JSON.parse File.read(json_filename)
@java_class = JavaClass.new json_data

stamp 'javaClass.java', "#{@java_class.name}.java"
