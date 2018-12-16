# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Upload files in your Ruby applications, map them to a range of ORMs, store them on different backends"
HOMEPAGE="https://github.com/carrierwaveuploader/carrierwave"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.2.0"
ruby_add_rdepend ">=dev-ruby/activemodel-3.2.0"
ruby_add_rdepend ">=dev-ruby/json-1.7"
ruby_add_rdepend ">=dev-ruby/mime-types-1.16"
ruby_add_rdepend ">=dev-ruby/mimemagic-0.3.0"
ruby_add_rdepend ">=dev-ruby/pg-0"
ruby_add_rdepend ">=dev-ruby/rails-3.2.0"
ruby_add_rdepend ">=dev-ruby/cucumber-1.3.2"
ruby_add_rdepend ">=dev-ruby/rspec-2.13.0"
ruby_add_rdepend ">=dev-ruby/sham_rack-0"
ruby_add_rdepend ">=dev-ruby/fog-1.20.0"
ruby_add_rdepend ">=dev-ruby/unf-0"
ruby_add_rdepend ">=dev-ruby/net-ssh-2.9.0"
ruby_add_rdepend ">=dev-ruby/mini_magick-3.6.0"
ruby_add_rdepend ">=dev-ruby/rmagick-0"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.5.10"
ruby_add_rdepend "=dev-ruby/timecop-0.6.1"
ruby_add_rdepend ">=dev-ruby/generator_spec-0"

