# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="An intelligent layer for ActiveRecord (via Rails and Sinatra) for the Sphinx full-text search tool"
HOMEPAGE="http://pat.github.io/thinking-sphinx/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-3.1.0"
ruby_add_rdepend ">=dev-ruby/builder-2.1.2"
ruby_add_rdepend ">=dev-ruby/innertube-1.0.2"
ruby_add_rdepend ">=dev-ruby/joiner-0.2.0"
ruby_add_rdepend ">=dev-ruby/middleware-0.1.0"
ruby_add_rdepend ">=dev-ruby/riddle-1.5.11"

