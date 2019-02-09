# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_EXTRADOC="README.md AUTHORS.md CHANGELOG.md"

inherit ruby-fakegem

DESCRIPTION="A DSL for quickly creating web applications in Ruby with minimal effort"
HOMEPAGE="http://www.sinatrarb.com/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/mustermann-1.0
	dev-ruby/rack:2.0
	=dev-ruby/rack-protection-2.0.5
	dev-ruby/tilt:2
"
ruby_add_bdepend "test? ( >=dev-ruby/rack-test-0.5.6 dev-ruby/erubis dev-ruby/builder )"

all_ruby_prepare() {
	# Remove implicit build dependency on git.
	sed -i -e '/\(s.files\|s.test_files\|s.extra_rdoc_files\)/d' sinatra.gemspec || die
}