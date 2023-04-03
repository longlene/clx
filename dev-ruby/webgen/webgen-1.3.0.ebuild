# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="webgen is used to generate static websites from templates and content
files (which can be written in a markup language)"
HOMEPAGE="http://webgen.gettalong.org"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/cmdparse-2.0"
ruby_add_rdepend ">=dev-ruby/systemu-2.5"
ruby_add_rdepend ">=dev-ruby/kramdown-1.3"
ruby_add_rdepend ">=dev-ruby/rake-0.8.3"
ruby_add_rdepend ">=dev-ruby/minitest-5.0"
ruby_add_rdepend ">=dev-ruby/diff-lcs-1.0"
ruby_add_rdepend ">=dev-ruby/maruku-0.7"
ruby_add_rdepend ">=dev-ruby/RedCloth-4.1"
ruby_add_rdepend ">=dev-ruby/haml-4.0"
ruby_add_rdepend ">=dev-ruby/sass-3.2"
ruby_add_rdepend ">=dev-ruby/builder-2.1"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0"
ruby_add_rdepend ">=dev-ruby/coderay-1.0"
ruby_add_rdepend ">=dev-ruby/erubis-2.6"
ruby_add_rdepend ">=dev-ruby/rdiscount-1.3"
ruby_add_rdepend ">=dev-ruby/archive-tar-minitar-0.5"

