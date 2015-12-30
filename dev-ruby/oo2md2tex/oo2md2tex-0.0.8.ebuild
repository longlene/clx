# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A barebone Markdown to TeX/LaTeX converter kit via OmniOutliner"
HOMEPAGE="http://github.com/shigeya/oo2md2tex"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/redcarpet-2.1"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.5"

