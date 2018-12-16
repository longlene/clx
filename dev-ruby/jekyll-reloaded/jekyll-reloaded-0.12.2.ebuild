# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Jekyll is a simple, blog aware, static site generator"
HOMEPAGE="https://github.com/mislav/jekyll/tree/reloaded"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/liquid-2.2"
ruby_add_rdepend ">=dev-ruby/classifier-1.3"
ruby_add_rdepend ">=dev-ruby/directory_watcher-1.1"
ruby_add_rdepend ">=dev-ruby/maruku-0.5"
ruby_add_rdepend ">=dev-ruby/kramdown-0.13"
ruby_add_rdepend ">=dev-ruby/pygments_rb-0.2.4"
ruby_add_rdepend ">=dev-ruby/rake-0.9"
ruby_add_rdepend ">=dev-ruby/rdoc-3.11"
ruby_add_rdepend ">=dev-ruby/redgreen-1.2"
ruby_add_rdepend ">=dev-ruby/shoulda-2.11"
ruby_add_rdepend ">=dev-ruby/rr-1.0"
ruby_add_rdepend "=dev-ruby/cucumber-1.1"
ruby_add_rdepend ">=dev-ruby/redcloth-4.2"
ruby_add_rdepend ">=dev-ruby/rdiscount-1.6"
ruby_add_rdepend ">=dev-ruby/redcarpet-1.9"

