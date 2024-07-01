require 'fileutils'

namespace :package do
  desc "Package the schemas for release to a client"
  task :client_schemas do
    FileUtils.rm_rf("./package", verbose: true)
    FileUtils.mkdir("./package", verbose: true)
    Dir.chdir("XSD/XMLSchemas") do
      system("zip -r XMLSchemas.zip constraint")
    end
    FileUtils.mv("XSD/XMLSchemas/XMLSchemas.zip", "package/", verbose: true)
  end

  desc "Package the schemas into a single folder for aca_entities"
  task :aca_entities do
    FileUtils.rm_rf("./package", verbose: true)
    FileUtils.mkdir("./package", verbose: true)
    FileUtils.mkdir("./package/XMLSchemas", verbose: true)
    FileUtils.cp_r("./XSD/XMLSchemas/constraint", "./package/XMLSchemas/", verbose: true)
  end
end