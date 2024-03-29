# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Dragonfly is a framework that enables on-the-fly processing for any content type"
HOMEPAGE="http://github.com/markevans/dragonfly"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-1.3"
ruby_add_rdepend ">=dev-ruby/multi_json-1.0"
ruby_add_rdepend ">=dev-ruby/addressable-2.3"
ruby_add_rdepend ">=dev-ruby/rspec-2.5"
ruby_add_rdepend ">=dev-ruby/webmock-0"
ruby_add_rdepend ">=dev-ruby/activemodel-0"

