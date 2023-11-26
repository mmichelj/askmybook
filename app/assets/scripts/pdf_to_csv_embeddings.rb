require 'optparse'
require 'pdf/reader'
require "baran"

# Initialize variables
key = ''
pdf_path = ''
csv_path = 'embeddings.csv'


# Define option parser and create instance
optparse = OptionParser.new do |parser|
  parser.banner = "Usage: pdf_to_csv_embeddings.rb [options]"

  parser.on("-k", "--key KEY", "OpenAI secret key") { |v| key = v }
  parser.on("-p", "--pdf PDF", "Path to pdf file - path/to/file.pdf") { |v| pdf_path = v }
  parser.on("-c", "--csv CSV", "Optional: csv file name - default: embeddings.csv") { |v| csv_path = v }

end.parse!

# Check if key is empty
unless key && !key.empty?
    puts "Please provide an OpenAI secret key."
    exit(1)
end

# Check if pdf path has .pdf, otherwise fail
unless pdf_path && pdf_path.include?(".pdf")
    puts "Please provide the path to a .pdf file and include the file extension."
    exit(1)
end

# Read pdf pages, for each page, generate OpenAI embedding and save in csv file
reader = PDF::Reader.new(pdf_path)
text_to_embed = ''
previous_page_context = ''

reader.pages.each do |page|
    # Extract pdf text and remove page numbers
    text_to_embed = text_to_embed + page.text.gsub(/\n|\s+(\d+)/,' ')
end

splitter = Baran::RecursiveCharacterTextSplitter.new(
    chunk_size: 1024,
    chunk_overlap: 64,
    separators: ["\"", "\n", " ", ""]
)

chunks = splitter.chunks(text_to_embed)

chunks.each do |chunks|
    # Call open AI api
end