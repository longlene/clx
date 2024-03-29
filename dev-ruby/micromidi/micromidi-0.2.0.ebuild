# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby DSL for MIDI"
HOMEPAGE="http://github.com/arirusso/micromidi"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/minitest-5.5"
ruby_add_rdepend ">=dev-ruby/mocha-1.1"
ruby_add_rdepend ">=dev-ruby/rake-10.4"
ruby_add_rdepend ">=dev-ruby/shoulda-context-1.2"
ruby_add_rdepend ">=dev-ruby/midi-eye-0.3"
ruby_add_rdepend ">=dev-ruby/midi-fx-0.4"
ruby_add_rdepend ">=dev-ruby/midi-message-0.4"
ruby_add_rdepend ">=dev-ruby/unimidi-0.4"

