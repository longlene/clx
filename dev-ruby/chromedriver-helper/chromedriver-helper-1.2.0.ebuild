# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Easy installation and use of chromedriver, the Chromium project's selenium webdriver adapter"
HOMEPAGE="https://github.com/flavorjones/chromedriver-helper"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/concourse-0.16"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.8"
ruby_add_rdepend ">=dev-ruby/archive-zip-0.10"

