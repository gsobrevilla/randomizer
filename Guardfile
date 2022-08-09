# Guardfile
# More info at https://github.com/guard/guard#readme

guard :shell do
    watch /Localizable.csv/ do |m|
        `./generate.sh`
    end
end