import pikepdf


pw = ""
pdf_list = [
    "Formal Offer Cover.Pdf",
    "Customer Details.Pdf",
    "Offer Document.Pdf",
    "Terms and Conditions.Pdf",
    "Mortgage Illustration.Pdf",
]

for pdf_file in pdf_list:
    inpath = f"../../Downloads/{pdf_file}"
    outpath = f"../../Desktop/{pdf_file}"
    pdf = pikepdf.open(inpath, password=pw)
    pdf.save(outpath)

# pdf_loc = input("PDF location: ")
# pdf_pass = input("PDF password: ")

# pdf = pikepdf.open(pdf_loc, password=pdf_pass)

# print("\nProcessing...\n")

# pdf_save = input("Save file as: ")
# pdf_loc2 = input("Save location: ")

# pdf.save(pdf_loc2 + "\\" + pdf_save)

# print("The password successfully removed from the PDF")
# print("\aLocation: " + pdf_loc + "\\" + pdf_save)
