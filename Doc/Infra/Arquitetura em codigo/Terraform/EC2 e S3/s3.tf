

  resource "aws_s3_bucket" "website" {
    bucket = "digital-booking-site"


    tags = {
        Name  = "My bucket"
        Environment = "Dev"
    }
 
  
  
  }

  //para acessar o bucket fora da aws
    resource "aws_s3_bucket_acl" "website" {
      bucket = aws_s3_bucket.website.id
      acl = "public-read" 
      
      
    }


  //versionamento do bucket
    resource "aws_s3_bucket_versioning" "website"{
      bucket = aws_s3_bucket.website.id

      //aqui habilita o versionamento
      versioning_configuration{
        status = "Enabled"
      }

    }



  resource "aws_s3_bucket_website_configuration" "website"{

    bucket = aws_s3_bucket.website.id

     index_document {

      suffix = "index.html" # Especifique o arquivo HTML principal/inicial do site

    }
  }



    resource "aws_s3_bucket_policy" "website"{
      bucket = aws_s3_bucket.website.id
      policy = data.aws_iam_policy_document.allow_public_access.json

    }
 

  
  data "aws_iam_policy_document" "allow_public_access" {

    statement {

      principals{

        type        = "*" //qualquer um pode performar as actions, nos recursos abaixo
        identifiers = ["*"]

      }

      actions = [
       "s3:GetObject",  //permite pegar os objetos
       "s3:ListBucket",  //permite listar o bucket
        
      ]

      resources = [
           aws_s3_bucket.website.arn,
        "${aws_s3_bucket.website.arn}/*", //são todos os abjetos do nosso bucket
      ]
    }

  }

    //aqui é onde eu direi os endpoints das paginas ( esse é do index)

    resource "aws_s3_object" "index_page" {

      bucket = aws_s3_bucket.website.id
      
      key    = "index.html" //nome do arquivo

      content_type = "text/html;charset=UTF-8"
      
     source = "index.html" //Caminho completo da imagem /arquivo

     etag = filemd5("index.html") #essa função cria uma hasg do arquivo, sempre que mudar o arquivo, o terraform modifica a hash

    }

