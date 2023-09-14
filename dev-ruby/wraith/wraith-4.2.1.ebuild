# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby22 ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Wraith is a screenshot comparison tool, created by developers at BBC News"
HOMEPAGE="https://github.com/BBC-News/wraith"

LICENSE="Apache 2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/casperjs-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/image_size-0"
ruby_add_rdepend ">=dev-ruby/mini_magick-4.8"
ruby_add_rdepend ">=dev-ruby/anemone-0"
ruby_add_rdepend ">=dev-ruby/robotex-0"
ruby_add_rdepend ">=dev-ruby/log4r-0"
ruby_add_rdepend ">=dev-ruby/thor-0"
ruby_add_rdepend ">=dev-ruby/parallel-0"
ruby_add_rdepend ">=dev-ruby/selenium-webdriver-3.5"
ruby_add_rdepend ">=dev-ruby/chromedriver-helper-1.1"

