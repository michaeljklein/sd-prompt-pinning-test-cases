#!/usr/bin/env ruby

require 'yaml'

puts 'updating index.html and README.md'
puts

# generate test case lines
test_case_lines = []
test_case_html_lines = []
YAML.load_file('test_cases.yaml').each do |test_name, test_attributes|
  test_case_lines << "#{test_name}\n"
  test_case_html_lines << "      <li>\n"
  test_case_html_lines << "        #{test_name}\n"
  test_case_html_lines << "        <ul>\n"

  test_attributes.each do |test_attribute|
    if test_attribute.is_a?(String)
      test_case_lines << "- #{test_attribute}\n"
      test_case_html_lines << "          <li>\n"
      test_case_html_lines << "            #{test_attribute}\n"
      test_case_html_lines << "          </li>\n"
    elsif test_attribute.is_a?(Hash)
      if test_attribute.to_a.size == 1
        key = test_attribute.keys.first
        value = test_attribute.values.first
        if key == 'Run'
          path = Dir['./**/index.html'].select{|x| x.match?(/#{value}/)}.first
          test_case_lines << "- #{key}: `#{value}`\n"
          test_case_html_lines << "          <li>\n"
          test_case_html_lines << "            #{key}: <a href=\"#{path}\">#{path}</a>\n"
          test_case_html_lines << "          </li>\n"
        elsif key == 'From'
          test_case_lines << "- #{key}: #{value}\n"
          from_link = value.match(/\[(?<link>[^\]]*)\]\(/)['link']
          test_case_html_lines << "          <li>\n"
          test_case_html_lines << "            #{key}: <a href=\"#{from_link}\">#{from_link}</a>\n"
          test_case_html_lines << "          </li>\n"
        else
          test_case_lines << "- #{key}: `#{value}`\n"
          test_case_html_lines << "          <li>\n"
          test_case_html_lines << "            #{key}: <code>#{value}</code>\n"
          test_case_html_lines << "          </li>\n"
        end
      else
        raise "test_cases.yaml: unknown case: #{test_attribute.class}: #{test_attribute}"
      end
    else
      raise "test_cases.yaml: unknown case: #{test_attribute.class}: #{test_attribute}"
    end
  end
  test_case_lines << "\n"
  test_case_html_lines << "        </ul>\n"
  test_case_html_lines << "      </li>\n"
  test_case_html_lines << "\n"
end

# get previous README.md (skipping previous test cases)
new_readme_lines = []
inside_readme_test_runs = false
File.readlines('README.md').each do |line|
  if /🚧/.match?(line)
    inside_readme_test_runs = true
    new_readme_lines << "#{line}\n"
    new_readme_lines << "\n"
  end

  if inside_readme_test_runs
    if /^.. References/.match?(line)
      inside_readme_test_runs = false

      new_readme_lines += test_case_lines
      new_readme_lines << "\n"
      new_readme_lines << line
    end
  else
    new_readme_lines << line
  end
end

# write README.md
File.open('README.md', 'w') do |file|
  new_readme_lines.each do |line|
    file.write(line)
  end
end


# write index.html
File.open('index.html', 'w') do |file|
  file.write("<!DOCTYPE html>\n")
  file.write("<html>\n")
  file.write("  <head>\n")
  file.write("  </head>\n")
  file.write("  <body>\n")
  file.write("    <h2>Example cases:</h2>\n")
  file.write("    <ul>\n")

  test_case_html_lines.each do |line|
    file.write(line)
  end

  file.write("    <ul>\n")
  file.write("  </body>\n")
  file.write("</html>\n")
end

puts 'updated index.html and README.md'

