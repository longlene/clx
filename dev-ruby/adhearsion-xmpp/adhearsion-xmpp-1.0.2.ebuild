# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This gem provides the XMPP plugin to Adhearsion, allowing your Adhearsion application to send and receive messages and react to presence changes"
HOMEPAGE="https://github.com/adhearsion/adhearsion-xmpp"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/adhearsion-2.0"
ruby_add_rdepend ">=dev-ruby/activesupport-3.0.10"
ruby_add_rdepend ">=dev-ruby/i18n-0.5.0"
ruby_add_rdepend ">=dev-ruby/blather-1.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.7.0"
ruby_add_rdepend ">=dev-ruby/rake-0.9.2"

