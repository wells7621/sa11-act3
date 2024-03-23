def parse_invoices(invoice_data)
    invoice_data.each_line do |line|
        pattern = /(\d{4}-\d{2}-\d{2}) - ([A-Z]{3}\d{3}) - ([a-zA-Z\s]+) - (\$\d+)/

        match = line.match(pattern)

        if match
            date = match[1]
            invoice_num = match[2]
            client_name = match[3]
            amount = match[4]

            puts "Date: #{date}, Invoice Number: #{invoice_num}, Client: #{client_name}, Amount: #{amount}"
        end
    end
end

invoice_entries = <<-INVOICES
2023-03-01 - INV001 - Acme Corp - $1000
2023-03-02 - INV002 - Beta LLC - $2050
2023-03-03 - INV003 - Gamma Inc - $3500
INVOICES

parse_invoices(invoice_entries)