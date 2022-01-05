# See https://docs.oracle.com/en-us/iaas/images/
# for the eu-frankfurt-1 region

variable "images" {
  type = map(string)

  default = {
      cent-os-6x             = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaagoetyy2c5hoyaax5wytihkfavfuv4iexfuco2pe4qf5e5bmpqjjq" # End of support
      cent-os-7x             = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaawhvrawkfuppm47wqgjf5rrzi4dalnzoqleqwy2ihe7dqycsspm7q"
      cent-os-8x             = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaah7fv5a2qw7lvux7mspw2yygemniqoe5x5t3hodzmf7uki64dqrtq" # End of support
      oracle-auto-linux-7x   = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaahkmjpxpndvvaxigizwpdp4ryjettpkamznshez22jqzii2mm7u6q"
      oracle-linux-6x        = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa3rjxpkcfs44y5hdf7xmhunx2ipdmbem2bevpayv7gmwuyycbk57a"
      oracle-linux-7x        = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaawq2h5g4nb6odpdt3rwyvp7bx26fv5pyjpbwzlwnybztss34vuz2q"
      oracle-linux-8x        = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa6yzyxbic6qu7nsq7x3cvzd3cmhd4vvg623jesbdssjlg2x3bqdnq"
      oracle-cloud-linux-8x  = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaz2ib5englusvczhkmz2rqlhdb4qyvbet5s4iiy2vanzz4m5rsejq"
      ubuntu-14-04           = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaruudywtcakrhs6iw3hhjxroyd6t3fyngzofcmkvlugliquxecntq" # End of support
      ubuntu-16-04           = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaarcgfunltfs5kljdp2tfjula5ac6ulqtxwa525v2nvijch5cigiaa" # End of support
      ubuntu-18-04           = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaauvdz4qrx4v57ekpvh264ayrproytpqkwhdfawy4rbblttigwis3q"
      ubuntu-20-04           = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaalepl4teucgdomo6jbzgskc4r6fhrz7tp5twfosnqp47lk5v6qoa"
  }
}
