# Publish images signed with a key-pair

Two points here are very important:
- First, the image is automatically built and publish every time a commit is made with the help of GitHub Actions and the workflow
- Secondly, the image is signed using a private key before being published. 

## Features of the key-pair signing technology
This signature method is more difficult and time-consuming to implement on GitHub than the keyless method. For this method to work, one needs to provide externally a key pair and a password from cosign, a PAT(Perrsonal Access Token) on GitHub and a GITHUB_TOKEN.

## How to verify an image signature made with key-pairs
In the command prompt, type in:
`cosign verify --key cosign.pub ghcr.io/USERNAME/IMAGE_NAME`

## How to sign one's image with a private key?
create a PAT -> 
