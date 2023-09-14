# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="itextomml provides native Ruby bindings to itex2MML, which converts itex equations to MathML"
HOMEPAGE="http://golem.ph.utexas.edu/~distler/blog/itex2MML.html"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


