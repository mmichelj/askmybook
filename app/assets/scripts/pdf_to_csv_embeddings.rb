require 'optparse'
require 'pdf/reader'
require 'csv'
require 'baran'
require 'uri'
require 'net/http'
require 'json'

# Define constants
OPENAI_EMBEDDING_URI = "https://api.openai.com/v1/embeddings"
OPENAI_EMBEDDING_MODEL = "text-embedding-ada-002"

def get_openai_embeddings(text, key)
    uri = URI(OPENAI_EMBEDDING_URI)
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true

    body = {}
    body['input'] = text
    body['model'] = OPENAI_EMBEDDING_MODEL

    request = Net::HTTP::Post.new(uri.request_uri)
    request['Authorization'] = "Bearer " + key
    request['Content-Type'] = 'application/json'

    request.body = body.to_json
    response = https.request(request)

    JSON.parse(response.body)
end

def read_pdf(path)
    # Read pdf pages, for each page, generate OpenAI embedding and save in csv file
    reader = PDF::Reader.new(path)
    pdf_text = ''
    previous_page_context = ''

    reader.pages.each do |page|
        # Extract pdf text and remove page numbers
        pdf_text = pdf_text + page.text.gsub(/\n|\s+(\d+)/,' ')
    end
    return pdf_text
end

def split_text(text)
    splitter = Baran::RecursiveCharacterTextSplitter.new(
        chunk_size: 1024,
        chunk_overlap: 64,
        separators: ["\"", "\n", " ", ""]
    )

    chunks = splitter.chunks(text)
end

# Define option parser and create instance
options = {
    csv_path: 'pdf_embeddings.csv'
}

OptionParser.new do |parser|
  parser.banner = "Usage: pdf_to_csv_embeddings.rb [options]"

  parser.on("-k", "--key KEY", "OpenAI secret key") do |v| 
    options[:key] = v
  end

  parser.on("-p", "--pdf PDF", "Path to pdf file - path/to/file.pdf") do |v|
    options[:pdf_path] = v 
  end

  parser.on("-c", "--csv CSV", "Optional: csv file name - default: embeddings.csv") do |v| 
    options[:csv_path] = v 
  end
end.parse!

# Check if key is empty
unless options[:key] && !options[:key].empty?
    puts "Please provide an OpenAI secret key."
    exit(1)
end

# Check if pdf path has .pdf, otherwise fail
unless options[:pdf_path] && options[:pdf_path].include?(".pdf")
    puts "Please provide the path to a .pdf file and include the file extension."
    exit(1)
end

pdf_text = read_pdf(options[:pdf_path])

batches = split_text(pdf_text)

# Open or create csv file
CSV.open(options[:csv_path], 'w') do |csv|
    # Write headers
    csv << ['text', 'embeddings']

    # Process batches
    batches.each do |batch|
        # Call open AI api to get embeddings
        response = get_openai_embeddings(batch[:text], options[:key])
    
        # Save in csv file
        csv << [batch[:text], response["data"][0]["embedding"].join(',')]
    end
end
