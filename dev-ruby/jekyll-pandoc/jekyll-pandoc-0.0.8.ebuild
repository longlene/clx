# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Jekyll markdown converter that uses Pandoc (via the pandoc-ruby gem)"
HOMEPAGE="https://github.com/mfenner/jekyll-pandoc"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/jekyll-1.4.3"
ruby_add_rdepend ">=dev-ruby/pandoc-ruby-0.7.5"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.6"
ruby_add_rdepend ">=dev-ruby/rdiscount-2.1.7"

