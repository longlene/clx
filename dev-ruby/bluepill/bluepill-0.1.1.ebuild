# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Bluepill keeps your daemons up while taking up as little resources as possible"
HOMEPAGE="http://github.com/bluepill-rb/bluepill"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.2"
ruby_add_rdepend ">=dev-ruby/blue-daemons-1.1"
ruby_add_rdepend ">=dev-ruby/state_machine-1.1"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"

