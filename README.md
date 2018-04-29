new rails app without minitest, with mysql, api only

    $ rails new application_name -T -d mysql --api

generate products model

    rails g model Product product_name:string product_image:string product_description:text

generate variants model

    rails g model Variant product:references waist:integer length:integer style:string count:integer
