# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Small command line tool that reads Markdown files and outputs HTML"
HOMEPAGE="http://github.com/jameswilding/markup"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rdiscount-1.3.5"
ruby_add_rdepend ">=dev-ruby/thoughtbot-shoulda-2.10.2"
ruby_add_rdepend ">=dev-ruby/redgreen-1.2.2"

