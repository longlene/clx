# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Lightweight ETL for Ruby"
HOMEPAGE="http://thbar.github.io/kiba/"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/minitest-5.9"
ruby_add_rdepend ">=dev-ruby/awesome_print-0"
ruby_add_rdepend ">=dev-ruby/minitest-focus-0"

