require 'fileutils'

namespace :package do
  desc "Clean the package directory"
  task :clean do
    FileUtils.rm_rf("./package", verbose: true)
  end

  desc "Package the schemas for release to a client"
  task :client_schemas => :clean do
    FileUtils.mkdir("./package", verbose: true)
    FileUtils.mkdir("./package/XMLSchemas", verbose: true)
    FileUtils.cp_r("./XSD/XMLSchemas/constraint", "./package/XMLSchemas/", verbose: true)
    FileUtils.cp_r("./client/examples", "./package/", verbose: true)
    FileUtils.cp_r("./client/schematron", "./package/", verbose: true)
    FileUtils.cp_r("./client/README.md", "./package/", verbose: true)
    Dir.chdir("./package") do
      system("zip -r ClientSchemas.zip XMLSchemas examples schematron README.md")
    end
    FileUtils.rm_rf("./package/XMLSchemas", verbose: true)
    FileUtils.rm_rf("./package/examples", verbose: true)
    FileUtils.rm_rf("./package/schematron", verbose: true)
    FileUtils.rm_rf("./package/README.md", verbose: true)
  end

  desc "Package the schemas into a single folder for aca_entities"
  task :aca_entities => :clean do
    FileUtils.mkdir("./package", verbose: true)
    FileUtils.mkdir("./package/XMLSchemas", verbose: true)
    FileUtils.cp_r("./XSD/XMLSchemas/constraint", "./package/XMLSchemas/", verbose: true)
  end
end
