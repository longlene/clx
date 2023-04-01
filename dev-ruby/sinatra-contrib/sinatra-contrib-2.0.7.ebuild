# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Collection of useful Sinatra extensions"
HOMEPAGE="http://github.com/sinatra/sinatra-contrib"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/backports-2.0"
ruby_add_rdepend ">=dev-ruby/multi_json-0"
ruby_add_rdepend ">=dev-ruby/mustermann-1.0"
ruby_add_rdepend "=dev-ruby/rack-protection-2.0.0"
ruby_add_rdepend ">=dev-ruby/sinatra-2.0.0"
ruby_add_rdepend ">=dev-ruby/tilt-1.3"

