# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Parse EPUB 3 book loosely"
HOMEPAGE="http://www.rubydoc.info/gems/epub-parser/file/docs/Home.markdown"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/archive-zip-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/pry-doc-0"
ruby_add_rdepend ">=dev-ruby/test-unit-0"
ruby_add_rdepend ">=dev-ruby/test-unit-rr-0"
ruby_add_rdepend ">=dev-ruby/test-unit-notify-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/gem-man-0"
ruby_add_rdepend ">=dev-ruby/ronn-0"
ruby_add_rdepend ">=dev-ruby/epzip-0"
ruby_add_rdepend ">=dev-ruby/aruba-0"
ruby_add_rdepend ">=dev-ruby/zipruby-0"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.6"
ruby_add_rdepend ">=dev-ruby/nokogumbo-0"
ruby_add_rdepend ">=dev-ruby/addressable-2.3.5"
ruby_add_rdepend ">=dev-ruby/rchardet-1.6.1"

