# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=" Jekyll-Scholar is for all the academic bloggers out there"
HOMEPAGE="http://github.com/inukshuk/jekyll-scholar"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/jekyll-2.0"
ruby_add_rdepend ">=dev-ruby/citeproc-ruby-1.0"
ruby_add_rdepend ">=dev-ruby/csl-styles-1.0"
ruby_add_rdepend ">=dev-ruby/bibtex-ruby-4.0"

