# Sign images with a self-generated key-pair

Two points here are very important:
- First, the image is automatically built and publish every time a commit is made with the help of GitHub Actions and the workflow
- Secondly, the image is signed using a private key before being published. 

## How to
- create your cosign key pair with the command cosign generate-key-pair
- uploa the key pair to GitHub as secrets
- login into Github container registry
- pull an unsigned image
- sign the image with  a cosign command

## How to verify an image signature made with key-pairs
In the command prompt, type in:
`cosign verify --key cosign.pub ghcr.io/USERNAME/IMAGE_NAME`


# Sign images with aprivate key in an HSM
run this script on Powershell while changing the name of the repo and that of the image.

          cosign generate ghcr.io/tadiesse/hello-docker > payload.json
          
          Get-Content payload.json | Get-FileHash -Algorithm SHA256 | ForEach-Object { $_.Hash } | Out-File -Encoding ASCII -FilePath payload.hash
          
          .\signclient signdocument -workername CosignIntegrationTest -infile payload.hash -outfile payload.sig -host signservice-playground.ct.siemens.com -port 443 -truststore truststore-playground.jks -truststorepwd $env:TRUSTSTORE_PASSWORD
          
          [convert]::ToBase64String([System.IO.File]::ReadAllBytes('payload.sig')) | Out-File -Encoding ASCII -FilePath payloadbase64.sig
          
          cosign attach signature --payload payload.json --signature payloadbase64.sig ghcr.io/tadiesse/hello-docker
